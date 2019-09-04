FactoryBot.define do
  factory :user do
    name { "John" }
    email  { "joe@gmail.com" }
    password { "123456" }
    description {"test description"}
  end
end
