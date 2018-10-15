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
    db.query("INSERT INTO pokemon (id, name, type) values (?, ?, ?)", [p.id, p.name, p.type])
  end

  def self.find(id, db)
    result = db.query("SELECT * FROM pokemon WHERE id = ?", [id])
    binding.pry
  end
end
