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
    pokemon = ALL.detect { |p| p.name == name && p.type == type }
    sql = db.prepare("INSERT INTO pokemon (id, name, type) values (?, ?, ?)")
    test = sql.execute(1)
    binding.pry
  end
end
