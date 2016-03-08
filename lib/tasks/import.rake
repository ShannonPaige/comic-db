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
      deadpool = service.get_deadpool
      counter = 0
      Character.find_or_create(character_id: ,name: )
      #   counter += 1 if character.persisted?
      # end
      #
      # puts "Imported #{counter} cuharacters"
    end

end
