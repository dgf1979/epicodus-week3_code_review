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

end
