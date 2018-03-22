require('pg')
require('pry')

def self.all()
  sql = "SELECT * FROM artists"
  artists = SqlRunner.run(sql)
  return artists.map { |person| Artist.new(person)}
end

class Albums

  attr_reader :id, :title, :genre, :artist_id

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id']
  end

  def save()
    db = PG.connect( { dbname: 'albums_artists', host: 'localhost' } ) #could be music-collection
    sql = "INSERT INTO albums
    (title, genre, artist_id)
    VALUES
    ($1, $2, $3)
    RETURNING id"
    values = [@title, @genre, @artist_id]

    db.prepare("save", sql)
    result = db.exec_prepared("save", values)
    db.close()
    @id = result[0]['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map { |person| Albums.new(person)}
  end



end
