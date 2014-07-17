require_relative 'choice'
require_relative 'petition'

class PetitionChoice < Choice
  def url
    "https://api.whitehouse.gov/v1/petitions.json?limit=10&status=open"
  end

  def model
    Petition
  end

  def results
    data["results"]
  end

end
