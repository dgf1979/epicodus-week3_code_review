class Client
  attr_reader(:id, :name, :stylist_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    if attributes.has_key?(:id)
      @id = attributes.fetch(:id)
    end
    if attributes.has_key?(:stylist_id)
      @id = attributes.fetch(:stylist_id)
    end
  end

  define_method(:save) do
    sql = "INSERT INTO clients (name) VALUES ('#{@name}') RETURNING id"
    results = DB.exec(sql)
    @id = results.first().fetch('id').to_i
  end

  define_singleton_method(:all) do
    all_clients = []
    sql = "SELECT * FROM clients"
    results = DB.exec(sql)
    results.each do |result|
      name = result.fetch('name')
      id = result.fetch('id').to_i
      stylist_id = result.fetch('stylist_id').to_i
      all_clients.push(Client.new({ :name => name, :id => id, :stylist_id => stylist_id }))
    end
    return all_clients
  end

  define_singleton_method(:find) do |id|
    sql = "SELECT * FROM clients WHERE id = #{id}"
    results = DB.exec(sql)
    result = results.first()
    name = result.fetch('name')
    return Client.new({ :name => name, :id => id })
  end

  define_method(:delete) do
    sql = "DELETE FROM clients WHERE id = #{@id};"
    DB.exec(sql)
  end

end
