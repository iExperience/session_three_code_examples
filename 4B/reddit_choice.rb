require_relative 'choice'
require_relative 'reddit'

class RedditChoice < Choice
  def url
    "http://www.reddit.com/top.json?limit=10"
  end

  def model
    Reddit
  end

  def results
    data["data"]["children"]
  end
end
