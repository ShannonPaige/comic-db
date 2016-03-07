class ConnectionsController < ApplicationController
  respond_to :html, :json

  def new
  end

  def create
    binding.pry
    @connection = Character.find_connection(params[:first_character], params[:second_character])
    respond_with @connection
  end
end
