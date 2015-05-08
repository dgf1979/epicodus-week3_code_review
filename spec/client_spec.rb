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

end
