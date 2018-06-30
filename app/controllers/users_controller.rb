class UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
    @tweets = @user.tweets
  rescue ActiveRecord::RecordNotFound => e
    render 'users/404', status: :not_found 
  end
end
