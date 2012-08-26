namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Fede",
                 email: "federicofrumento21@hotmail.com",
                 password: "estaba",
                 password_confirmation: "estaba")
    admin.toggle!(:admin)
    5.times do |n|
      name  = Faker::Name.name
      email = "pirulo#{n+1}@pirulo.com"
      password  = "estaba"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    5.times do |n|
      titulo  = "Tiulo#{n+1}"
      contenido = "contenido#{n+1}"
      Question.create!(title: titulo,
                   content: contenido,
                   user_id: n+1)
    end
  end
end