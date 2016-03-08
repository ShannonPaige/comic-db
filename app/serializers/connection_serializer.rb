class ConnectionSerializer < ActiveModel::Serializer
  attributes :nodes, :edges

  def nodes
    Connection.get_nodes(object)
  end

  def edges
    Connection.get_edges(object)
  end
end
