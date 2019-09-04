FactoryBot.define do
  factory :tast do
    title { 'Title 1' }
    description { 'Description example' }
  end

  factory :user do
    name { "John" }
    email  { "joe@gmail.com" }
    password { "123456" }
    description {"test description"}
  end
end