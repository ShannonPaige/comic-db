class Character
  include Neo4j::ActiveNode
  property :character_id
  property :name
  property :deck
  property :image

  validates :character_id, :presence => true, :uniqueness => true
  validates :name,         :presence => true, :uniqueness => true

  has_many :both, :friends, type: :friends, model_class: :Character, unique: true
  has_many :both, :enemies, type: :enemies, model_class: :Character, unique: true

  scope :in_order, ->(identifier){ order("n.#{identifier} ASC")}

  def self.find_connection(char1, char2)
    first_character     = Character.find_by(name: char1)
    second_character    = Character.find_by(name: char2)
    Neo4j::Session.query("MATCH p=
                        (d:Character {name: '#{first_character.name}'})
                        -[*1..6]-
                        (m:Character {name: '#{second_character.name}'})
                         RETURN p
                         LIMIT 50").to_a
  end

end
