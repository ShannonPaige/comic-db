class Connection

  def self.service
    Neo4jService.new
  end

  def self.get_nodes(connection)
    connection.first["p"]["nodes"].map do |node|
      node.gsub!('http://localhost:7474/db/data/', '')
      {"name": service.neo4j_node(node)}
    end
  end

  def self.get_links(connection)
    connection.first["p"]["relationships"].map do |relationship|
      relationship.gsub!('http://localhost:7474/db/data/', '')
      rel = service.neo4j_link(relationship)
      {"source": rel[0], "target": rel[1], "value": rel[2]}
    end
  end


private

  def self.build_object(data)
    OpenStruct.new(data)
  end

end
