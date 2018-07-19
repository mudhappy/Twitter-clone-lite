require 'rails_helper'

RSpec.describe Hashtag, type: :model do
  let(:tweet) { FactoryBot.build(:tweet) }

  it 'should be created by a tweet' do
    tweet.body = 'holi soy #flash'

    expect{
      tweet.save
    }.to change{ Hashtag.count }

    expect(Hashtag.last.name).to eq('flash')
  end

  it 'many hashtags should be created by a tweet' do
    tweet.body = '#flash el #hombre más #rapido'

    expect{
      tweet.save
    }.to change{ Hashtag.count }.by (3)
  end

  it 'should be created if not exists yet' do
    tweet.body = '#flash el #hombre más #rapido #rapido #flash el #hombre'

    expect{
      tweet.save
    }.to change{ Hashtag.count }.by (3)
  end

  it 'should be have a tweets association' do
    FactoryBot.create(:tweet, body: 'hola soy #genial y eres #bueno')
    FactoryBot.create(:tweet, body: 'la marca #genial es muy buena')
    FactoryBot.create(:tweet, body: 'lo #genial que está el evento')

    expect(Hashtag.find_by(name: 'genial').tweets.count).to eq(3)
    expect(Tweet.last.hashtags.first).to eq(Hashtag.find_by(name: 'genial'))
  end

  describe 'Regex' do
    it 'should be accept accents' do
      tweet.body = 'Flash el más #rápido'
  
      expect{
        tweet.save
      }.to change{ Hashtag.count }.by (1)
    end
  end
end
