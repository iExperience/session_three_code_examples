class Story

  attr_reader :data

  # exact same
  # def data
  #   @data
  # end

	def initialize(hash_that_represents_json)
		@data = hash_that_represents_json
	end

  # retrieve the title from data
  def title
    raise NotImplementedError
  end

  # retrieve the url from data
  def url
    raise NotImplementedError
  end

	def to_s
		"#{title}: #{url}"
	end
end