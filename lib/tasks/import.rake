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
      avengers = service.team_avengers
      counter = 0


      #   character = Character.create(character_id: ,
                                        # name: )
      #   counter += 1 if character.persisted?
      # end
      #
      # puts "Imported #{counter} cuharacters"
    end

end
