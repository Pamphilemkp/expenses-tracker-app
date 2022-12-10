require 'rails_helper'

RSpec.describe Entity, type: :model do
  @user = User.create(name: 'Pamphile', email: 'pelico@gmail.com', password: '123456')
  @group = Group.new(name: 'Food', icon: 'smile', author: @user)
  subject do
    Entity.create(name: 'Salad', amount: 100, group: @group)
  end

  before { subject.save }

  it 'name must be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'the amount must be present' do
    subject.amount = 100
    expect(subject).to_not be_valid
  end
end
