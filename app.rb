require('sinatra')
require('sinatra/reloader')
require('./lib/client')
require('./lib/stylist')
also_reload('lib/**/*.rb')
require('pry')
require('pg')

DB = PG.connect({:dbname => 'hair_salon'})

get('/test') do
  @test_var = 'Sinatra OK'
  erb(:test)
  #redirect to('/')
end

#default route with static links
get('/') do
  erb(:index)
end


#list clients
get('/clients') do
  @all_clients = Client.all()
  erb(:clients)
end

#add client form
get('/clients/new') do
  erb(:client_new_form)
end

#create client
post('/clients/new') do
  name = params.fetch('name')
  new_client = Client.new({ :name => name})
  new_client.save()
  redirect to('/clients')
end
