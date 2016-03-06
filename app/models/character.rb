class Character
  include Neo4j::ActiveNode
  property :character_id
  property :name
  property :aliases
  property :deck
  property :publisher
  property :img
  property :created_at
  property :updated_at

  validates :character_id, :presence => true, :uniqueness => true
  validates :name,         :presence => true, :uniqueness => true

  has_many :both, :friends, type: :friends, model_class: :Character, unique: true
  has_many :both, :enemies, type: :enemies, model_class: :Character, unique: true

  # THE CODE!!!
  # MATCH p=(d:Character {name: character1})-[*1..6]-(m:Character {name: character2}) RETURN p
#
# Neo4j::Session.query.match('(q: Character {name: {name}})').params(name: 'Archie').pluck(:q)
# query.match('n-[:friends]->o').where(o: {age: 42}, n: {age: 1})



  def self.find_connection(char1, char2)
    first_character_id  = char1[:character_id].to_i
    second_character_id = char2[:character_id].to_i
    first_character     = Character.find_by(character_id: first_character_id)
    second_character    = Character.find_by(character_id: second_character_id)
    Neo4j::Session.query("MATCH p=
                        (d:Character {name: '#{first_character.name}'})
                        -[*1..6]-
                        (m:Character {name: '#{second_character.name}'})
                         RETURN p")
                        .to_a
  end

end
