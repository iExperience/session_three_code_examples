class Reddit < Story

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