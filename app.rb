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

#
##CLIENTS##
#
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

#client details
get('/clients/:id') do
  id = params.fetch('id')
  @client = Client.find(id)
  @stylist = Stylist.find(@client.stylist_id())
  erb(:client_details)
end

#
##Stylists
#
#list stylists
get('/stylists') do
  @all_stylists = Stylist.all()
  erb(:stylists)
end

#add stylists form
get('/stylists/new') do
  erb(:stylist_new_form)
end

#create stylists
post('/stylists/new') do
  name = params.fetch('name')
  new_stylist = Stylist.new({ :name => name})
  new_stylist.save()
  redirect to('/stylists')
end

#stylist details
get('/stylists/:id') do
  id = params.fetch('id')
  @stylist = Stylist.find(id)
  erb(:stylist_details)
end
