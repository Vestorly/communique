require "spec_helper"
require 'pry'
describe User do
  it 'has a configuration already set' do
    expect(Communique.config).to_not be_nil
  end

  it 'has notifications' do
    user = User.new

    Communique.notify(
      user: user,
      name: 'hello',
      info: {problem: 'beautiful day'},
      action: 'pleasant_day'
    )
  end

end
