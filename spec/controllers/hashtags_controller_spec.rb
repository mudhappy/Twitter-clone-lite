require 'rails_helper'

RSpec.describe HashtagsController, type: :controller do
  let!(:tweet) { FactoryBot.create(:tweet, body: 'hola soy #adrian') }
  let!(:hashtag) { tweet.hashtags.first }

  describe 'GET /tweets/:random_string_id' do
    context 'when the record exist' do
      before { get( 'show', params: { name: hashtag.name }) }

      it 'returns a 200 status code' do
        expect(response).to have_http_status(:success)
      end

      it 'returns a response html' do
        expect(response.content_type).to eq('text/html')
      end
    end

    context 'when the record not exist' do
      before { get( 'show', params: { name: 'noexiste' }) }

      it 'return 404 status code' do
        expect(response).to have_http_status(:not_found)
      end

      it 'return 404 html' do
        expect(response.content_type).to eq('text/html')
      end
    end
  end
end
