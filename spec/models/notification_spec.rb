require "spec_helper"
describe Communique::Notification do
  describe '#viewed_all' do
    it 'makes all notifications seen' do
      dummy = NotifiableDummy.create
      Communique.notify(
        dummy,
        'r2d2_broke_with_a_500',
        name: 'broken robot',
        location: 'proxy issue'
      )
      Communique.notify(
        dummy,
        '3CPO_fell_down_and_hit_his_head',
        name: 'broken robot',
        location: 'nginx caching issue'
      )
      expect(dummy.notifications.count).to be 2

      expect(dummy.notifications.first.seen).to be false
      expect(dummy.notifications.last.seen).to be false

      Communique.viewed_all! dummy
      dummy.reload

      expect(dummy.notifications.first.seen).to be true
      expect(dummy.notifications.last.seen).to be true

    end
  end
end
