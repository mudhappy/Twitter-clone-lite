class HashtagsController < ApplicationController
  def show
    @hashtag = Hashtag.find_by!(name: params[:name])
    @tweets = @hashtag.tweets
  rescue ActiveRecord::RecordNotFound => e
    render 'users/404', status: :not_found 
  end
end
