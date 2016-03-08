require 'rails_helper'

describe 'ComicVineService' do

  let(:service) do
    ComicVineService.new
  end

  describe "#team_avengers" do
    it "returns the characters from the avengers" do
        response = service.get_deadpool
        binding.pry
        expect(user_info[:data][:username]).to eq("diagonalizable")
        expect(user_info[:data][:full_name]).to eq("Shannon P")
        expect(user_info[:data][:id]).to eq("25151534")
    end
  end
end
