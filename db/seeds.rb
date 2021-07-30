
#User.create(name: 'Shivani Alya', gender: "Female", phoneNumber: 8871379123, dateBirth: "22/09/1996", admin: true, email: 'shivani@test.com', password: 'password', approve: true)

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?