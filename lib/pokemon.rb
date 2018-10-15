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
    p = ALL.detect { |p| p.name == name && p.type == type }
    db.prepare("INSERT INTO pokemon (id, name, type) values (?, ?, ?)").execute(p.id, name, type)
  end

  def self.find(id, db)
    result = db.prepare("SELECT * FROM pokemon WHERE id = ?").execute(id)
  end
end
