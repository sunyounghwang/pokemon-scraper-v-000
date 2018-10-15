class Pokemon
  attr_accessor :id, :name, :type, :db
  ALL = []

=begindef initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    ALL << self
  end
=end

  def initialize(attributes)
    attributes.each { |attribute, value| send("#{attribute}=", value) }
  end

  def self.save(name, type, db)
    poke = ALL.detect { |p| p.name == name && p.type == type }
    db.query("INSERT INTO pokemon (id, name, type) values (?, ?, ?)", [poke.id, poke.name, poke.type])
  end

  def self.find(id, db)
    poke_set = db.query("SELECT * FROM pokemon WHERE id = ?", [id])
    new()
  end
end
