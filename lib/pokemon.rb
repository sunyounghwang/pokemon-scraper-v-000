class Pokemon
  attr_accessor :id, :name, :type, :db
  ALL = []

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    ALL << self
  end

  def self.save(name, type, db)
    poke = ALL.detect { |p| p.name == name && p.type == type }
    db.query("INSERT INTO pokemon (id, name, type) values (?, ?, ?)", [poke.id, poke.name, poke.type])
  end

  def self.find(id, db)
    poke = db.query("SELECT * FROM pokemon WHERE id = ?", [id])
    binding.pry
  end
end
