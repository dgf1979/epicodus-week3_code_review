require('sinatra')
require('sinatra/reloader')
require('./lib/client')
require('./lib/stylist')
also_reload('lib/**/*.rb')
require('pry')
require('pg')

if (defined? DB) == nil
  DB = PG.connect({:dbname => 'hair_salon'})
end

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

#client delete
delete('/clients/:id') do
  id = params.fetch('id')
  client = Client.find(id)
  client.delete()
  redirect to('/clients')
end

#client assign a new stylist
patch('/clients/:id') do
  id = params.fetch('id')
  stylist_id = params.fetch('stylist_id')
  client = Client.find(id)
  client.assign_stylist_by_id(stylist_id)
  redirect to("/clients/#{id}")
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
  @assigned_clients = Client.find_by_stylist_id(@stylist.id())
  erb(:stylist_details)
end

#stylist delete
delete('/stylists/:id') do
  id = params.fetch('id')
  stylist = Stylist.find(id)
  stylist.delete()
  redirect to('/stylists')
end
