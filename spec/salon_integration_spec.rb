require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('Sinatra framework check', { :type => :feature }) do
  it('verifies basic routing and view setup') do
    visit('/test')
    expect(page).to have_content('Sinatra OK')
  end
end


# As a salon owner, I want to view, add, update, and delete stylists

# As a salon owner, I want to view, add, update and delete clients

# As a salon owner, I want to add clients to a stylist
