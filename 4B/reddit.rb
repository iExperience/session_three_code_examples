require_relative 'story'

class Reddit < Story

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
