class Story

  attr_reader :data

  # exact same
  # def data
  #   @data
  # end

	def initialize(hash_that_represents_json)
		@data = hash_that_represents_json
	end

  def title
    raise NotImplementedError
  end

  def url
    raise NotImplementedError
  end

	def to_s
		"#{title}: #{url}"
	end
end