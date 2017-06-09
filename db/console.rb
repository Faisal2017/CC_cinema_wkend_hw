require_relative('../models/customer.rb')
require_relative('../models/film.rb')
require_relative('../models/ticket.rb')

require('pry-byebug')

# Ticket.delete_all()
# Film.delete_all()
# Customer.delete_all()

customer1 = Customer.new ({ 
  'name' => 'Jim Holden', 
  'funds' => 200 
})

customer2 = Customer.new ({
  'name' => 'Joe Miller',
  'funds' => 100
  })

customer1.save
customer2.save

binding.pry
nil