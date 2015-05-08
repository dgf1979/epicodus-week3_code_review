require('spec_helper')

describe(Stylist) do
  describe('#id') do
    it('expects a fixnum to be returned from id') do
      new_stylist = Stylist.new({ :name => 'Donald Trump'})
      new_stylist.save()
      expect(new_stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end
end
