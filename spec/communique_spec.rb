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
end
