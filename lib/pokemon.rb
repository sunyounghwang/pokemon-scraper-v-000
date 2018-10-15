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
    db.prepare("INSERT INTO pokemon (id, name, type) values (?, ?, ?)").execute(p.id, p.name, p.type)
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE id = ?")
  end
end
