# jtbd: generate sample records for app

require_relative '../config/environment'
require 'bcrypt'

# individual tables

users = []
links = []
tags = []
user_links = []
link_tags = []

tables = {
  :users => users,
  :links => links,
  :tags => tags,
  :user_links => user_links,
  :link_tags => link_tags,
}

# hand written example records

fdelacruz = {
  :id => 1,
  :username => 'fdelacruz',
  :password_digest => BCrypt::Password.create("fdelacruz").to_s,
  :created_at => Time.parse("2014/1/1"),
  :updated_at => Time.parse("2014/1/27")
}

rails_link = {
  :id => 1,
  :url => 'http://example.com/rails.html',
  :created_at => Time.parse("2014/1/2")
}

rails_tags = {
  :id => 1,
  :name => 'rails',
}

users.push fdelacruz
links.push rails_link
tags.push rails_tags


# Generated data

# create random time *from*
def random_time time1 = Time.parse('2013/1/1')
  time2 = Time.now
  Time.at((time2.to_f - time1.to_f)*rand + time1.to_f)
end

def generate_username
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  full_name = first_name+" "+last_name
  username = (first_name[0]+last_name).downcase
end

2.upto(10).each do |id|
  username = generate_username
  created_at = random_time
  users.push({
    :id => id,
    :username => username,
    :password_digest => BCrypt::Password.create(username).to_s,
    :created_at => created_at,
    :updated_at => random_time(created_at),
  })
end

2.upto(50).each do |id|
  links.push({
    :id => id,
    :url => Faker::Internet.url,
    :created_at => random_time,
  })
end

2.upto(50).each do |id|
  tags.push({
    :id => id,
    :name => Faker::Hacker.adjective,
  })
end

lambda do

  tag_ids = tags.map { |r| r[:id] }.shuffle
  link_ids = links.map { |r| r[:id] }.shuffle

  2.upto(10).each do |id|
    link_tags.push({
      :id => id,
      :link_id => link_ids.pop,
      :tag_id => tag_ids.pop,
    })
  end

end.call

lambda do

  link_data = links.map { |r| [ r[:id], r[:created_at] ] }.shuffle
  user_data = users.map { |r| [ r[:id], r[:created_at] ] }.shuffle

  2.upto(10).each do |id|
    link_id, link_created_at = link_data.pop
    user_id, user_created_at = user_data.pop
    min_created_at = [link_created_at, user_created_at].max
    created_at = random_time(min_created_at)

    user_links.push({
      :id => id,
      :user_id => user_id,
      :link_id => link_id,
      :created_at => created_at,
      :updated_at => random_time(created_at),
    })
  end

end.call

# ---

yaml = YAML.dump tables

yaml = "# DON'T EDIT THIS, EDIT seed_generator.rb\n" + yaml
puts yaml
path = File.join(File.dirname(__FILE__), 'seed_data.yaml')
File.write path, yaml
