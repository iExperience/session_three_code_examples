class Story

  attr_reader :data

  def initialize(reddit)
    @data = reddit
  end

  def self.first(n)
    url = "http://www.reddit.com/top.json?limit=#{n}"
    response = RestClient.get url
    json_hash = JSON.parse(response)
    json_hash["data"]["children"].map do |reddit|
      Story.new(reddit)
    end
  end

  def title
    data["data"]["title"]
  end

  def url
    data["data"]["url"]
  end

  def body
    data["data"]["body"]
  end
end