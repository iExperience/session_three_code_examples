class TweetsController < ApplicationController

  # controllers job is to set instance variables available to views

  def index
    params[:handle] = params[:handle] || current_user.handle

    @new_tweet = Tweet.new
    @tweets = Tweet.for_user(params[:handle])
    @tweets = @tweets.search(params[:q])
    @tweets = @tweets.last(5)
  end

  def create
    Tweet.create_for_user(current_user, tweet_params)
    redirect_to tweets_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end