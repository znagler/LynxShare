# path = Rails.root.join('db/seed_data.yaml')
# seed_data = YAML.load File.read path

# # delete all old records

# seed_data.keys.each do |table_name|
#   ActiveRecord::Base.connection.execute "truncate #{table_name}"
# end

# # insert records

# def insert_sql table_name, attrs
#   table = Arel::Table.new(table_name)
#   insert_manager = Arel::InsertManager.new(ActiveRecord::Base)
#   insert_manager.insert(attrs.map { |key, val| [ table[key], val ] })
#   insert_manager.to_sql
# end

# sql = seed_data.map do |table_name, records|
#   records.map do |attrs|
#     insert_sql table_name, attrs
#   end
# end

# sql.flatten.each do |insert_sql|
#   ActiveRecord::Base.connection.execute insert_sql
# end


user = User.create(username: "admin", password: "password", password_confirmation: "password")

20.times do
  user = Faker::Internet.user_name
  User.create(username: user, password: user, password_confirmation: user)
end


# As a user I want to be able to create links.
100.times do
  Link.create(url: Faker::Internet.url)
end

#As a user I want to able to create tags
30.times do
  Tag.create(name: Faker::Lorem.word)
end

#As a user I want to be able to create add tags to my links

500.times do
  UserLink.create(user: User.all.sample, link: Link.all.sample)
end

100.times do
  LinkTag.create(tag_id: Tag.all.sample.id, link_id: Link.all.sample.id)
end


