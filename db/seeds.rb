require 'faker'

10.times do
    makemodel = Faker::Vehicle.make_and_model
    array = makemodel.split(" ")
    make = array[0]
    model = array[1]
    first_initial = Faker::Name.initials(number:1)
    last_name = Faker::Name.last_name
    random_num = Faker::Number.number(digits: 2)
    # username = (first_initial + last_name + random_num)
    username = [first_initial, last_name, random_num].join.strip
    user = User.create(user_name: username, name: Faker::Name.name, email: Faker::Internet.email,
    password: Faker::Internet.password)
    car = user.vehicles.create!(make: make, model: model, year: Faker::Vehicle.year, 
            price: Faker::Commerce.price(range:1500..100000, as_string: false),
            description: Faker::Vehicle.standard_specs.join(" "), color: Faker::Vehicle.color,
            mileage: Faker::Vehicle.mileage)
end

    # t.string "user_name"
    # t.string "name"
    # t.string "email"
    # t.string "password_digest"