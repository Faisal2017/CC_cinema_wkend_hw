require_relative('../db/sql_runner.rb')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options["id"]
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    db = PG.connect({ dbname: "cinema", host: "localhost"})
    sql = "INSERT INTO customers 
    (
    name,
    funds
    )
    VALUES
    (
    '#{@name}',
    '#{@funds}'
    )
    RETURNING id"
    @id = db.exec(sql)[0]["id"].to_i()
    db.close()
  end









end