FactoryBot.define do
  factory :author do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    password  {"123123"}
    phone {Faker::PhoneNumber.cell_phone}
  end
end
