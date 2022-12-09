require 'rails_helper'

RSpec.describe Group, type: :model do
  @user = User.create(name: 'Pamphile', email: 'pelico@gmail.com', password: '123456')

  subject do
      Group.new( name: 'Food', icon: 'smile', author: @user)
  end

  before { subject.save }

  it 'name must be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'the icon must be present' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
end
