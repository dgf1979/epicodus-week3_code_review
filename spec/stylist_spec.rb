require('spec_helper')

describe(Stylist) do
  describe('#id') do
    it('expects a fixnum to be returned from id') do
      new_stylist = Stylist.new({ :name => 'Donald Trump'})
      new_stylist.save()
      expect(new_stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('.all') do
    it('expects an array of objects equal to the number of saved object instances') do
      new_client = Stylist.new({ :name => 'Albert Einstein'})
      new_client.save()
      new_client = Stylist.new({ :name => 'Donald Trump'})
      new_client.save()
      expect(Stylist.all().first().class).to(eq(Stylist))
      expect(Stylist.all().length).to(eq(2))
    end
  end
end
