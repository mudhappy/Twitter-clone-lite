class UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
    @tweets = @user.tweets
  rescue ActiveRecord::RecordNotFound => e
    render 'users/404', status: :not_found 
  end

  def unauthenticated_landing
    @tweets = Tweet.all.order(created_at: 'DESC')
    @hashtags = Hashtag.all.limit(8).order(created_at: 'DESC')
  end
end
