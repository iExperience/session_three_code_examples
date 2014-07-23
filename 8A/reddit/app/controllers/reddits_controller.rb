class RedditsController < ApplicationController
  def index
    number = params[:number] || 10
    @reddits = Story.first(number)
  end
end