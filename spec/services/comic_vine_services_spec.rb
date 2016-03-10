require 'rails_helper'

describe 'ComicVineService' do

  let(:service) do
    ComicVineService.new
  end

  describe "#get_character" do
    it "returns the character from comicvine" do
        response = service.get_character(7606)

        expect(response[:id]).to eq(7606)
    end
  end
end
