require('pg')
require_relative('../db/sql_runner')

class Artists

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = (options)['name']
  end


  def save()
    db = PG.connect( { dbname: 'albums_artists', host: 'localhost' } ) #could be music-collection
    sql = "INSERT INTO artists
    (name)
    VALUES
    ($1)
    RETURNING id"
    values = [@name]

    db.prepare("save", sql)
    result = db.exec_prepared("save", values)
    db.close()
    @id = result[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map { |person| Artist.new(person)}
  end

end
