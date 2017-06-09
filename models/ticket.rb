require_relative('../db/sql_runner.rb')

class Ticket

  attr_accessor :id, :customer_id, :film_id

  def initializa(options)
    @id = options['id'].to_i if options["id"]
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
    db = PG.connect ({ dbname: "cinema", host: "localhost" })
    sql = "INSERT INTO tickets
    (
    customer_id,
    film_id
    )
    VALUES
    (
    '#{@customer_id}',
    '#{@film_id}'
    )
    RETURNING id"
    @id = db.exec(sql)[0].to_i
    db.close()
  end

  def Ticket.all()
    db = PG.connect ({ dbname: 'cinema', host: 'localhost' })
    sql = "SELECT * FROM tickets"
    ticket_hashes = db.exec(sql)
    db.close()
    return tickets = ticket_hashes.map { |ticket_hash| Ticket.new (ticket_hash) }
  end

  def Ticket.delete_all()
    db = PG.connect ({ dbname: 'cinema', host: 'localhost' })
    sql = "DELETE FROM tickets"
    db.exec(sql)
    db.close() 
  end






end