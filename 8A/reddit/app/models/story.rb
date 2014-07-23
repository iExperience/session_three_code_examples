class Story < ActiveRecord::Base

  def self.first(n)
    url = "http://www.reddit.com/top.json?limit=#{n}"
    response = RestClient.get url
    json_hash = JSON.parse(response)
    json_hash["data"]["children"].map do |data|
      story = Story.where(
        :title => data["data"]["title"],
        :url => data["data"]["url"]
      ).first_or_create
    end
  end
end