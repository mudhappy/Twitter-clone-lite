class HashtagsController < ApplicationController
  def show
    hashtag = Hashtag.find_by(name: params[:name])
    @tweets = hashtag.tweets
  end
end
