class ComicVineService
  attr_reader :comic_vine_connection

  def initialize
    @comic_vine_connection = Faraday.new(url: 'http://comicvine.gamespot.com/api/') do |faraday|
      faraday.adapter  Faraday.default_adapter
      faraday.params[:api_key] = ENV['comic_vine_key']
    end
  end

  def get_deadpool
    binding.pry
    parse(comic_vine_connection.get("character/4005-7606/?format=json&resources=character"))
  end


  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
