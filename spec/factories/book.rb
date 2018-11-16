FactoryBot.define do
  factory :book do
    name {Faker::Name.name}
    number_of_pages {rand(9)}
    price {rand(100)}
    association :author
    association :category
    association :publisher, factory: :publisher
  end
end
