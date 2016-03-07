class Api::V1::ConnectionsController < ApplicationController
  respond_to :json

  def index
    @connections = Character.find_connection(params[:first_character], params[:second_character])
    respond_with @connections.as_json
  end
end
