# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_link, :class => 'UserLinks' do
    user_id 1
    link_id 1
  end
end
