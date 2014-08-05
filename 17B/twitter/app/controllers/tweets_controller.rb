class TweetsController < ApplicationController

  # controllers job is to set instance variables available to views

  def index
    params[:handle] = params[:handle] || current_user.handle

    @user = User.find_by(handle: params[:handle])
    @new_tweet = Tweet.new
    @tweets = Tweet.for_user(params[:handle])
    @tweets = @tweets.search(params[:q])
    @tweets = @tweets.page(params[:page]) unless display_all?

    # if this was a request from javascript
    if request.xhr?
      # override render to not render layout
      # render :index, layout: false
      render partial: 'tweets', layout: false
    end
  end

  def create
    Tweet.create_for_user(current_user, tweet_params)
    redirect_to tweets_path
  end

  def destroy
    params[:handle] = params[:handle] || current_user.handle

    if admin?
      tweet = Tweet.find(params[:id])
      tweet.destroy
    end

    return head :ok if request.xhr?
    redirect_to tweets_path(params[:handle])
  end

  def chart
    @chart = Chart.new(current_user).create_chart
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end

  def admin?
    current_user.admin?
  end
  helper_method :admin?

  def display_all?
    params[:page] == "all"
  end
  helper_method :display_all?
end