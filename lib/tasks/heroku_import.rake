namespace :db do

  desc "Import Characters from API"
  task heroku_import: :environment do
    characters
  end

  private

    def service
      ComicVineService.new
    end

    def characters
      deadpool = service.get_character(7606)
      sleep 1
      d = create_character(deadpool, "Deadpool")
      counter = 1
      puts "#{counter} created"
      deadpool[:character_enemies].each do |enemy|
        name = enemy[:name]
        enemy = service.get_character(enemy[:id])
        sleep 1
        e = create_character(enemy, name)
        counter += 1
        puts "#{counter} created"
        d.enemies << e
      end

      deadpool[:character_friends].each do |friend|
        name = friend[:name]
        friend = service.get_character(friend[:id])
        sleep 1
        f = create_character(friend, name)
        counter += 1
        puts "#{counter} created"
        d.friends << f
        enemy[:character_friends].each do |f_friend|
          name = f_friend[:name]
          f_friend = service.get_character(f_friend.id)
          sleep 1
          f_friend = create_character(f_friend, name)
          counter += 1
          puts "#{counter} created"
          f.friends << f_friend
        end
      end

    end

    def create_character(character, name)
      deck = character[:deck] || "No description available"
      if character[:image]
        image = character[:image][:small_url] || "http://cache2.asset-cache.net/xt/165811120.jpg?v=1&g=fs1%7C0%7CISI%7C11%7C120&s=1"
      else
        image = "http://cache2.asset-cache.net/xt/165811120.jpg?v=1&g=fs1%7C0%7CISI%7C11%7C120&s=1"
      end
      Character.find_or_create( name: name,
                                deck: deck,
                                character_id: character[:id],
                                image: image)
    end
end
