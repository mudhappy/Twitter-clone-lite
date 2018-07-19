require 'rails_helper'

RSpec.describe Tweet, type: :model do
  let(:tweet) { FactoryBot.build(:tweet) }

  it 'is valid with a body text' do
    tweet.body = nil

    expect(tweet).to be_invalid
  end

  describe 'Random String Id' do
    let(:second_tweet) { FactoryBot.build(:tweet) }

    it 'should be unique' do

    expect{
      tweet.save
      second_tweet.random_string_id = tweet.random_string_id
      second_tweet.save
    }.to change{ Tweet.count }.by(2)

    expect(tweet.id).to_not eq(second_tweet.id)
    end

    it 'should have 16 chars length' do
      tweet.save

      expect(tweet.random_string_id.length).to eq(32)
    end
  end
end
