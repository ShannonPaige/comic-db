class Neo4jService
  attr_reader :neo4j_connection

  def initialize
    @neo4j_connection = Faraday.new(url: "#{ENV['db']}") do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def neo4j_node(node_id)
    parse(neo4j_connection.get(node_id))[:data][:name]
  end

  def neo4j_edge(relationship_id)
    response = parse(neo4j_connection.get(relationship_id))
    [ response[:start], response[:end], response[:type] ]
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
