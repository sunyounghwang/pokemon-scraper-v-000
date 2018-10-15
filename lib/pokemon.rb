class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(:id, :name, :type, :db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def save(:name, :type, :db)
    Pokemon.new(name, type, db)
  end
end
