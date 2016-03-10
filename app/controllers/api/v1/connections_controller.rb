class Api::V1::ConnectionsController < ApplicationController

  def index
    @connections = Character.find_connection(params[:first_character], params[:second_character])
    render  json: @connections.as_json, serializer: ::ConnectionSerializer
  end
end
