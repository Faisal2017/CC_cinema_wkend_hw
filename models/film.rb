require_relative('../db/sql_runner.rb')

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize( options )
    @id = options['id'].to_i if options["id"]
    @title = options['title']
    @price = options['price']    
  end

  def save()
    db = PG.connect({ dbname: "cinema", host: "localhost" })
    sql = "INSERT INTO films
    (
    title,
    price
    )
    VALUES
    (
    '#{@title}',
    '#{@price}'
    )
    RETURNING id"
    @id = db.exec(sql)[0]['id'].to_i()
    db.close()
  end










end

