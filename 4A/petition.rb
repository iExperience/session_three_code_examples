class Petition < Story

  def title
    data["data"]["title"]
  end

  def url
    data["data"]["url"]
  end

  def body
    # data is a hash or hashes
    data["data"]["body"]
  end
end