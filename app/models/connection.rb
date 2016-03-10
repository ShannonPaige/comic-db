class Connection

  def self.service
    Neo4jService.new
  end

  def self.get_nodes(connection)
    connection.first["p"]["nodes"].map do |node|
      node.gsub!("#{ENV['db']}", "")
      id = node.gsub('node/', '')
      {id: id, label: service.neo4j_node(node) }
    end
  end

  def self.get_edges(connection)
    connection.first["p"]["relationships"].map do |relationship|
      relationship.gsub!("#{ENV['db']}", "")
      rel = service.neo4j_edge(relationship)
      source_id = rel[0].gsub("#{ENV['db']}", "")
      source_id.gsub!("node/", "")
      target_id = rel[1].gsub("#{ENV['db']}", "")
      target_id.gsub!("node/", "")
      {from: source_id, to: target_id }
      # {source: source_id, target: target_id, label: rel[2]}
    end
  end


private

  def self.build_object(data)
    OpenStruct.new(data)
  end

end
