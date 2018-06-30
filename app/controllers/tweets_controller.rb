class TweetsController < ApplicationController
  before_action :authenticate_user!, :except => [:show]

  def index
    @tweet = current_user.tweets.new
    @tweets = Tweet.all.reverse
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    respond_to do |format|
      if @tweet.save
        format.js
        format.json { render json: @tweet }
      else
        format.js
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @tweet = Tweet.find_by(random_string_id: params[:random_string_id])
    @user = @tweet.user
  end

  private

  def tweet_params
    params.require(:tweet).permit(
      :body,
      :user_id
    )
  end

end
