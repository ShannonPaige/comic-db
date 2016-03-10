require 'rails_helper'

RSpec.describe Api::V1::ConnectionsController, type: :controller do

  let!(:first_character)   {Character.create(name: "Archie", character_id: 34567)}
  let!(:second_character)  {Character.create(name: "Jughead", character_id: 987654)}

  describe "GET #index" do
    it "returns http success" do
      first_character.friends << second_character
      get :index,   first_character:  first_character.name,
                    second_character: second_character.name
      expect(response).to have_http_status(:success)
    end
  end

end
