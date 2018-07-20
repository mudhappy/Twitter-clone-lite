require 'rails_helper'

RSpec.feature "Tweets", type: :feature do
  
  let(:user) { FactoryBot.create(:user) } 
  let(:tweet) { FactoryBot.build(:tweet, user_id: user.id) }
  
  scenario 'Create a Tweet', js: true do
    sign_in_as(user)

    expect{
      fill_in 'tweet_body', with: tweet.body
      click_button 'Twittear'
      expect(page).to have_content 'Tu tweet fue creado'
    }.to change{ Tweet.count }

  end
end
