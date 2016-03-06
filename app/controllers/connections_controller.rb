class ConnectionsController < ApplicationController
  def new
  end

  def create
    @connection = Character.find_connection(params[:first_character], params[:second_character])
    render :new
  end
end
