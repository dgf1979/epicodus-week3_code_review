require('rspec')
require('pg')
require('pry')
require('client')
require('stylist')

DB = PG.connect({:dbname => 'hair_salon_test'})

RSpec.configure do |config|
  config.before(:each) do
    #optionally do something before each test
  end
  config.after(:each) do
    DB.exec('DELETE FROM clients *;')
    DB.exec('DELETE FROM stylists *;')
  end
end
