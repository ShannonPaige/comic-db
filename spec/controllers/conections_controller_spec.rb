require 'rails_helper'

RSpec.describe ConnectionsController, type: :controller do

  let!(:first_character)   {Character.create(name: "Archie", character_id: 34567)}
  let!(:second_character)  {Character.create(name: "Jughead", character_id: 987654)}

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end
