require('sinatra')
require('sinatra/reloader')
require('./lib/sample')
also_reload('lib/**/*.rb')
require('pry')


get('/test') do
  @test_var = 'Sinatra OK'
  erb(:test)
  #redirect to('/')
end
