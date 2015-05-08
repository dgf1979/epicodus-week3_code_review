require('spec_helper')

describe(Client) do

  describe('#id') do
    it('expects a fixnum to be returned from id') do
      new_client = Client.new({ :name => 'Mr. Clean'})
      new_client.save()
      expect(new_client.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('.all') do
    it('expects an array of Client objects equal to the number of saved clients') do
      new_client = Client.new({ :name => 'Jason Statham'})
      new_client.save()
      new_client = Client.new({ :name => 'Bruce Willis'})
      new_client.save()
      expect(Client.all().first().class).to(eq(Client))
      expect(Client.all().length).to(eq(2))
    end
  end

  describe('.find') do
    it('locates and returns the saved object instance having the id') do
      new_client = Client.new({ :name => 'Bruce Willis'})
      new_client.save()
      expect(Client.find(new_client.id()).name()).to(eq('Bruce Willis'))
    end
  end

  describe('#delete') do
    it('deletes a row from the database whose id matches this object id') do
      new_client = Client.new({ :name => 'Bruce Willis'})
      new_client.save()
      new_client = Client.new({ :name => 'Bruce Willis'})
      new_client.save()
      expect(Client.all().length).to(eq(2))
      new_client.delete()
      expect(Client.all().length).to(eq(1))
    end
  end

  describe('#assign_stylist_by_id') do
    it('assigns a stylist to a client by passing the stylist id') do
      new_client = Client.new({ :name => 'Bruce Willis'})
      new_client.save()
      new_client.assign_stylist_by_id(1)
      expect(new_client.stylist_id()).to(eq(1))
      found_client = Client.find(new_client.id())
      expect(found_client.stylist_id()).to(eq(1))
    end
  end

end
