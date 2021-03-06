class Pokemon

attr_accessor :id, :name, :type, :db

@@all =[]

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self

  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type)VALUES(?,?)", name, type)
  end

  def self.find(id, db)
    array=db.execute("SELECT * FROM pokemon WHERE id = ?", id)[0]
      Pokemon.new(id:array[0],name:array[1],type:array[2],db:db)
  end
end
