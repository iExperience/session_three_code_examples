require_relative 'story'

class Petition < Story

  def title
    data["title"]
  end

  def url
    data["url"]
  end

  def domain
    data["domain"]
  end
end
