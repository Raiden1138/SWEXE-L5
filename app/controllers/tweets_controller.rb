class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  def new
    @tweet = Tweet.new
  end
  def create
    tweet = Tweet.new(message: params[:tweet][:message])
    tweet.save
    redirect_to '/tweets/index'
  end
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to '/tweets/index'
  end
  def create
    tweet = Tweet.find(params[:tweet_id])
    user = User.find_by(uid: session[:login_uid])
    user.like_tweets << tweet
    redirect_to root_path
  end
  def destroy
    tweet = Tweet.find(params[:id])
    user = User.find_by(uid: session[:login_uid])
    tweet.likes.find_by(user_id: user.id).destroy
    redirect_to root_path
  end
end
