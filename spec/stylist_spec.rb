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
      new_stylist = Stylist.new({ :name => 'Albert Einstein'})
      new_stylist.save()
      new_stylist = Stylist.new({ :name => 'Donald Trump'})
      new_stylist.save()
      expect(Stylist.all().first().class).to(eq(Stylist))
      expect(Stylist.all().length).to(eq(2))
    end
  end

  describe('.find') do
    it('locates and returns the saved object instance having the id') do
      new_stylist = Stylist.new({ :name => 'Albert Einstein'})
      new_stylist.save()
      expect(Stylist.find(new_stylist.id()).name()).to(eq('Albert Einstein'))
    end
  end

  describe('#delete') do
    it('deletes a row from the database whose id matches this object id') do
      new_stylist = Stylist.new({ :name => 'Albert Einstein'})
      new_stylist.save()
      new_stylist = Stylist.new({ :name => 'Donald Trump'})
      new_stylist.save()
      expect(Stylist.all().length).to(eq(2))
      new_stylist.delete()
      expect(Stylist.all().length).to(eq(1))
    end
  end

end
