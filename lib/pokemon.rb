class Pokemon
  ALL = []
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    ALL << self
  end

  def self.save(name:, type:, db:)
    ALL.detect
  end
end
