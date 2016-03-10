require 'rails_helper'

RSpec.describe Character, type: :model do

  let!(:first_character)   {Character.create(name: "Archie", character_id: 34567)}
  let!(:second_character)  {Character.create(name: "Jughead", character_id: 987654)}


  it "can find the connection path array" do
    first_character.friends << second_character
    response = Character.find_connection("Archie", "Jughead")

    expect(2).to eq(response.first[:p][:nodes].count)
    expect(1).to eq(response.first[:p][:relationships].count)

  end
end
