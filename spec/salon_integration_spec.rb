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

describe('Salon Management', { :type => :feature }) do

  describe('Stylists') do
    it('creates and verifies saving a new stylist') do
      visit('/stylists/new')
      fill_in('name', :with => 'Donald Trump')
      click_button('Add')
      expect(page).to(have_content('Donald Trump'))
    end

    it('deletes a stylist') do
      #add the cleint
      visit('/stylists/new')
      fill_in('name', :with => 'Donald Trump')
      click_button('Add')
      expect(page).to(have_content('Donald Trump'))
      #navigate to details for client
      click_link('Donald Trump')
      #delete the client
      click_button('Delete')
      expect(page).to_not(have_content('Donald Trump'))
    end
  end

  describe('Clients') do
    it('creates and verifies saving a new client') do
      visit('/clients/new')
      fill_in('name', :with => 'Bruce Willis')
      click_button('Add')
      expect(page).to(have_content('Bruce Willis'))
    end

    it('deletes a client') do
      #add the client
      visit('/clients/new')
      fill_in('name', :with => 'Bruce Willis')
      click_button('Add')
      expect(page).to(have_content('Bruce Willis'))
      #navigate to details for client
      click_link('Bruce Willis')
      #delete the client
      click_button('Delete')
      expect(page).to_not(have_content('Bruce Willis'))
    end

    it('assigns a stylist to the client') do
      #adds a stylist
      visit('/stylists/new')
      fill_in('name', :with => 'Donald Trump')
      click_button('Add')
      #add the client
      visit('/clients/new')
      fill_in('name', :with => 'Bruce Willis')
      click_button('Add')
      #navigate to details for client
      click_link('Bruce Willis')
      #select the stylist from the list and submit
      select('Donald Trump', :from => 'stylist_id')
      click_button('Assign')
      expect(page).to(have_content('Donald Trump'))
    end
  end

end

# As a salon owner, I want to view, add, update, and delete stylists

# As a salon owner, I want to view, add, update and delete clients

# As a salon owner, I want to add clients to a stylist
