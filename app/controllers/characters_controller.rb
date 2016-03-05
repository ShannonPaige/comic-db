class CharactersController < ApplicationController
  before_action :set_character, only: [:show]

  def show
  end

  private
    def set_character
      @character = Character.find(params[:id])
    end

    def character_params
      params.require(:character).permit(:character_id, :name, :aliases, :deck, :publisher, :img)
    end
end
