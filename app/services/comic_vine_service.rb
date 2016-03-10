class ComicVineService
  attr_reader :comic_vine_connection

  def initialize
    @comic_vine_connection = Faraday.new(url: 'http://comicvine.gamespot.com/api/') do |faraday|
      faraday.adapter  Faraday.default_adapter
      faraday.params[:api_key] = ENV['comic_vine_key']
      faraday.params[:resources] = "character"
      faraday.params[:field_list] = "id,image,deck,character_enemies,character_friends"
    end
  end

  def get_character(id)
    parse(comic_vine_connection.get("character/4005-#{id}/?format=json"))[:results]
  end


  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
