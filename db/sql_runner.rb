require ('pg')

class SqlRunner

  def self.all(sql, values = [])
    db = PG.connect({ dbname: 'albums_artists', host: 'localhost' })

    db.prepare("query", sql)
    result = db.exec_prepared( "query", values)

  ensure
    db.close() if db != nil #refractor up to close
  end
  return result
end


# maybe give up on the runner thing
