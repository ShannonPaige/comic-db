class DataSerializer < ActiveModel::Serializer
  attributes :dataSchema, :data

  def dataSchema
    {nodes: [
      { name: "label", type: "string" },
    ],
    edges: [ { name: "label", type: "string" },
    ]}
  end

  def data
    {
      nodes: Connection.get_nodes(object),
      edges: Connection.get_edges(object)
    }
  end

end
