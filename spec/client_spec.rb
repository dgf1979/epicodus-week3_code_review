require('spec_helper')

describe(Client) do
  describe('#id') do
    it('expects a fixnum to be returned from id') do
      new_client = Client.new({ :name => 'Mr. Clean'})
      new_client.save()
      expect(new_client.id()).to(be_an_instance_of(Fixnum))
    end
  end
end
