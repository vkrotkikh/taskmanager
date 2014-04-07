FactoryGirl.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    password {"user_pass#{Faker::Internet.password}"}
  end

  factory :project do
    name {Faker::Company.name}

    factory :invalid_project do
      name nil
    end
  end
end
