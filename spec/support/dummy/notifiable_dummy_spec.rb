require 'spec_helper'
describe NotifiableDummy do
  it 'has a configuration already set' do
    expect(Communique.config).to_not be_nil
  end

  it 'has notifications' do
    dummy = NotifiableDummy.new

    Communique.notify(
      dummy,
      'pleasant_day',
      name: 'hello',
      problem: 'beautiful day'

    )
    expect(dummy.notifications.first.context_info[:name]).to eq('hello')
  end
end
