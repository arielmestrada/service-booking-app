# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# create admin
User.create(
    email: "admin@email.com",
    password: '123456',
    password_confirmation: '123456',
    is_admin: true,
    first_name: 'John',
    last_name: 'Middleton',
    contact_number: 9111111111,
    street: 'Maracas Street',
    village: 'Caramba Village',
    city: 'Desmile City',
    province: 'Cutlet',
    postal_code: 1111
)

# create dummy 1 (with payment option)

User.create(
    email: "dummy01@email.com",
    password: '123456',
    password_confirmation: '123456',
    is_admin: false,
    first_name: 'Lucretia',
    last_name: 'Sayson',
    contact_number: 9222222222,
    street: 'Juv Street',
    village: 'Karikar Village',
    city: 'Raoq City',
    province: 'Clore',
    postal_code: 2222
)

# PaymentOption.create(
#     card_number: 12345678,
#     expiry_date: "12/03/2030",
#     registered_name: "Mendy Sayson",
#     card_type: "visa",
#     user_id: User.find_by(email: "dummy01@email.com").id
# )

# create dummy 2

User.create(
    email: "dummy02@email.com",
    password: '123456',
    password_confirmation: '123456',
    is_admin: false,
    first_name: 'Benjamin',
    last_name: 'Dunkin',
    contact_number: 9333333333,
    street: 'Glopal Street',
    village: 'Coveloop Village',
    city: 'Guren City',
    province: 'Timothy',
    postal_code: 3333
)

# create sample shop

# Category.create(
#     name: "Cutting & Styling",
#     description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi mollis commodo quam, id porta lectus vehicula eget."
# )

# Service.create(
#     name: "Haircut",
#     description: "Nullam aliquet iaculis purus non faucibus. Praesent sollicitudin pulvinar iaculis.",
#     price: 200.00,
#     category_id: Category.find_by(name: "Cutting & Styling").id
# )

# Schedule.create(
#     available_date: "20/10/2022",
#     service_id: Service.first.id
# )

# Timeslot.create(
#     available_time: "[22:30:00]",
#     slots: 4,
#     schedule_id: Schedule.first.id
# )

# Schedule.create(
#     available_date: "21/10/2022"
# )

# Schedule.create(
#     available_date: "22/10/2022"
# )

# Category.create(
#     name: "Make-up",
#     description: "Quisque tempus est non orci volutpat rutrum. Duis leo eros, rutrum ac tortor ut, varius aliquet tellus."    
# )
