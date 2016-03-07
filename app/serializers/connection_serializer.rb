class ConnectionSerializer < ActiveModel::Serializer
  attributes :nodes, :links

  def nodes
    Connection.get_nodes(object)
  end

  def links
    binding.pry
    Connection.get_links(object)
  end
end
