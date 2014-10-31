path = Rails.root.join('db/seed_data.yaml')
seed_data = YAML.load File.read path

# delete all old records

seed_data.keys.each do |table_name|
  ActiveRecord::Base.connection.execute "truncate #{table_name}"
end

# insert records

def insert_sql table_name, attrs
  table = Arel::Table.new(table_name)
  insert_manager = Arel::InsertManager.new(ActiveRecord::Base)
  insert_manager.insert(attrs.map { |key, val| [ table[key], val ] })
  insert_manager.to_sql
end

sql = seed_data.map do |table_name, records|
  records.map do |attrs|
    insert_sql table_name, attrs
  end
end

sql.flatten.each do |insert_sql|
  ActiveRecord::Base.connection.execute insert_sql
end
