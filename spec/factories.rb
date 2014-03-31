FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
    password Faker::Internet.password
  end

  factory :project do
    name Faker::Company.name
  end
end
