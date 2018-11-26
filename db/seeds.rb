User.create!(name: "Minh Tue",
  email: "nvminhtue@gmail.com",
  phone: "0905507959",
  password: "123123",
  type: User::Publisher.name,
)
10.times do
  name  = Faker::Name.name
  email = Faker::Internet.email
  password = "123123"
  phone = Faker::PhoneNumber.cell_phone
  type = User::Renter.name
  User.create!(name: name,
    email: email,
    password: password,
    phone: phone,
    type: type)
end

5.times do
  Author.create!(name: Faker::Name.unique.name)
end

Category.create!(name: "Truyen")
Category.create!(name: "Truyen tranh",parent_id: 1)
Category.create!(name: "Truyen trinh tham",parent_id: 1)
Category.create!(name: "Truyen tranh co mau",parent_id: 2)
Category.create!(name: "Truyen tranh khong mau",parent_id: 2)
Category.create!(name: "Truyen Nhat",parent_id: 3)
Category.create!(name: "Truyen Viet Nam",parent_id: 3)
Category.create!(name: "Tu Dien")

10.times do |i|
  rand = Random.rand(8)
  Book.create!(name: Faker::Name.unique.name,
    description: Faker::Lorem.sentence(4),
    quantity: rand(10),
    price: 60,
    number_of_pages: 100,
    publisher_id: 1,
    author_id: rand(1..5),
    category_id: rand(1..4)
  )
end

User::Renter.all.each do |renter|
  Renting.create!(
    return_day_at: rand(2.week.ago..Time.now),
    actual_day_at: rand(1.week.ago..Time.now),
    user_id: renter.id,
    book_id: 1
    )
end
