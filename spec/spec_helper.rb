require('rspec')
require('pg')
require('pry')
require('sample')

#DB = PG.connect({:dbname => 'sample'})

RSpec.configure do |config|
  config.before(:each) do
    #optionally do something before each test
  end
  config.after(:each) do
    #DB.exec('DELETE FROM sample_db *;')
  end
end
