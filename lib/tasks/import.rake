namespace :db do

  desc "Import Characters from API"
  task import: :environment do
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
        enemy[:character_enemies].each do |e_enemy|
          name = e_enemy[:name]
          e_enemy = service.get_character(e_enemy[:id])
          sleep 1
          e_enemy = create_character(e_enemy, name)
          counter += 1
          puts "#{counter} created"
          e.enemies << e_enemy
        end
        enemy[:character_friends].each do |e_friend|
          name = e_friend[:name]
          e_friend = service.get_character(e_friend[:id])
          sleep 1
          e_friend = create_character(e_friend, name)
          counter += 1
          puts "#{counter} created"
          e.friends << e_friend
        end
      end

      deadpool[:character_friends].each do |friend|
        name = friend[:name]
        friend = service.get_character(friend[:id])
        sleep 1
        f = create_character(friend, name)
        counter += 1
        puts "#{counter} created"
        d.friends << f
        friend[:character_enemies].each do |f_enemy|
          name = f_enemy[:name]
          f_enemy = service.get_character(f_enemy[:id])
          sleep 1
          f_enemy = create_character(f_enemy, name)
          counter += 1
          puts "#{counter} created"
          f.enemies << f_enemy
        end
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
