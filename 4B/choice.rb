class Choice

  attr_reader :data

  def initialize
    response = RestClient.get(url)
    @data = JSON.parse(response)
  end

  # should be a string that represents a url
  def url
    raise NotImplementedError
  end

  # the class that will recieve the story hash
  def model
    raise NotImplementedError
  end

  # implement to get the story from the data
  def results
    raise NotImplementedError
  end

  def stories
    results.map {|story| model.new(story) }
  end

end
