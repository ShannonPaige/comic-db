class Character
  include Neo4j::ActiveNode
  property :character_id, type: Integer
  property :name, type: String
  property :aliases, type: String
  property :deck, type: String
  property :publisher, type: String
  property :img, type: String

  has_many :both, :friends, type: :friends, model_class: :Character
  has_many :both, :enemies, type: :enemies, model_class: :Character

  # THE CODE!!!
  # MATCH p=(d:Character {name:"Deadpool"})-[*1..6]-(m:Character {name:"Magneto"}) RETURN p


end
