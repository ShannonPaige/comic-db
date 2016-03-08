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

  def self.find_connection(char1, char2)
    first_character     = Character.find_by(name: char1)
    second_character    = Character.find_by(name: char2)
    Neo4j::Session.query("MATCH p=
                        (d:Character {name: '#{first_character.name}'})
                        -[*1..6]-
                        (m:Character {name: '#{second_character.name}'})
                         RETURN p")
                        .to_a
  end

end
