class Stylist
  attr_reader(:id, :name)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    if attributes.has_key?(:id)
      @id = attributes.fetch(:id)
    end
  end

  define_method(:save) do
    sql = "INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id"
    results = DB.exec(sql)
    @id = results.first().fetch('id').to_i
  end

  define_singleton_method(:all) do
    all_stylists = []
    sql = "SELECT * FROM stylists"
    results = DB.exec(sql)
    results.each do |result|
      name = result.fetch('name')
      id = result.fetch('id').to_i
      all_stylists.push(Stylist.new({ :name => name, :id => id }))
    end
    return all_stylists
  end

end
