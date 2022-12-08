require 'rails_helper'

RSpec.describe Category, type: :model do
  @user = User.create(name: 'Pamphile', email: 'pelico@gmail.com', password: '123456')
  subject do
    Category.new(user_id: @user, name: 'Fufu', icon: 'delicious')
  end

  before { subject.save }

  it 'recipe user to be the user that created it' do
    expect(subject.user).to be == @user
  end
end
