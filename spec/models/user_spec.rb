require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  it 'is a valid with a username' do
    @user.username = nil

    expect(@user).to be_invalid
    expect(@user.errors.messages.to_s).to match(/username/)
  end

  it 'is a valid with a name' do
    @user.name = nil

    expect(@user).to be_invalid
    expect(@user.errors.messages.to_s).to match(/name/)
  end

  it 'is a valid with a non-existent email' do
    @user.save
    @second_user = FactoryBot.build(:user, email: @user.email)

    expect(@second_user).to be_invalid
    expect(@second_user.errors.messages.to_s).to match(/email/)
  end
end
