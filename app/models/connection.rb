class Connection

  def self.service
    Neo4jService.new
  end

  def self.get_nodes(connection)
    connection.first["p"]["nodes"].map do |node|
      node.gsub!('http://localhost:7474/db/data/', '')
      id = node.gsub('node/', '')
      {id: id, label: service.neo4j_node(node)}
    end
  end

  def self.get_edges(connection)
    connection.first["p"]["relationships"].map do |relationship|
      relationship.gsub!('http://localhost:7474/db/data/', '')
      rel = service.neo4j_edge(relationship)
      source_id = rel[0].gsub('http://localhost:7474/db/data/node/', '')
      target_id = rel[1].gsub('http://localhost:7474/db/data/node/', '')
      {from: source_id, to: target_id }
      # {source: source_id, target: target_id, label: rel[2]}
    end
  end


private

  def self.build_object(data)
    OpenStruct.new(data)
  end

end
