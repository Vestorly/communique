require 'spec_helper'
describe Communique::Handler do
  describe '#external_services' do
    context 'no config block' do
      it 'works with no config block' do
        expect(Communique::Handler)
          .to receive(:external_services)
          .and_return nil

        dummy = NotifiableDummy.create
        Communique.notify(
          dummy,
          'death_star_deadlock',
          name: 'locked star',
          location: 'it moves really fast'
        )
      end
    end

    context 'with config block' do
      let(:dummy_handler) { HandlerDummy.new }
      before(:each) do
        Communique.configure do |config|
          config.set_notification_handler do |notification, action, dummy|
            dummy_handler.push_notification(notification, action, dummy)
          end
        end
      end

      it 'external block gets called' do
        dummy = NotifiableDummy.create
        Communique.notify(
          dummy,
          'death_star_deadlock',
          name: 'locked star',
          location: 'it moves really fast'
        )

        expect(dummy_handler.notification.context_info[:name])
          .to eq('locked star')
        expect(dummy_handler.action.key).to eq('death_star_deadlock')
        expect(dummy_handler.notifiable.class.name).to eq('NotifiableDummy')
      end
    end
  end
end
