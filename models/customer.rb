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

  def Customer.all()
    db = PG.connect ({ dbname: 'cinema', host: 'localhost' })
    sql = "SELECT * FROM customers"
    customer_hashes = db.exec(sql)
    db.close()
    return customers = customer_hashes.map { |customer_hash| Customer.new (customer_hash) }
  end

  def Customer.delete_all()
    db = PG.connect ({ dbname: 'cinema', host: 'localhost' })
    sql = "DELETE FROM customers"
    db.exec(sql)
    db.close() 
  end





end