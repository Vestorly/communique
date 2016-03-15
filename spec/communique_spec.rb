require 'spec_helper'
describe Communique do
  describe '#actions' do
    it 'returns all actions' do
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
      expect(Communique.actions.count).to eq 2
      expect(Communique.actions.map(&:key)).to contain_exactly(
        'r2d2_broke_with_a_500', '3CPO_fell_down_and_hit_his_head'
      )
    end
  end
  describe 'config.prevent_unseen_duplicates' do
    it 'creates notifications when prevent_unseen_duplicates if false' do
      Communique.configure { |config| config.prevent_unseen_duplicates = false }

      dummy = NotifiableDummy.create
      2.times do
        Communique.notify(
          dummy,
          '3CPO_fell_down_and_hit_his_head',
          name: 'broken robot',
          location: 'nginx caching issue'
        )
      end
      expect(dummy.notifications.count).to be 2

    end

    it 'updates notifications when prevent_unseen_duplicates if true' do
      Communique.configure { |config| config.prevent_unseen_duplicates = true }

      dummy = NotifiableDummy.create
      2.times do
        Communique.notify(
          dummy,
          '3CPO_fell_down_and_hit_his_head',
          name: 'broken robot',
          location: 'nginx caching issue'
        )
      end
      expect(dummy.notifications.count).to be 1
    end

  end
end
