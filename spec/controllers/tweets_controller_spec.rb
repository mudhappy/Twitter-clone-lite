require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  let(:tweet_params) { FactoryBot.attributes_for(:tweet) }

  describe 'GET /tweets' do
    context 'when user is login' do
      before do
        sign_in(user)
        get('index')
      end

      it 'response success status code' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'when user does not login' do
      before do
        get('index')
      end

      it 'redirects to sign_in url' do
        expect(response.header.to_s).to match(/sign_in/)
      end
    end
  end

  describe 'POST /tweets' do
    context 'when user is login' do
      before do
        sign_in(user)
      end

      context 'when have valid params' do
        it 'create a tweet' do
          expect{
            post( 'create', params: { tweet: tweet_params }, xhr: true )
          }.to change { Tweet.count }
        end
  
        it 'returns a javascript ajax' do
          post( 'create', params: { tweet: tweet_params }, xhr: true )
          expect(response.content_type).to eq('text/javascript')
        end
      end

      context 'when have invalid params' do
        let(:tweet_params) { FactoryBot.attributes_for(:tweet, :invalid) }

        it 'returns a javascript errors' do
          post( 'create', params: { tweet: tweet_params }, xhr: true )

          expect(response.content_type).to eq('text/javascript')
        end
      end
    end

    context 'when user does not login' do
      before do
        post( 'create', params: { tweet: tweet_params }, xhr: true)
      end

      it 'returns unauthorized status code' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
