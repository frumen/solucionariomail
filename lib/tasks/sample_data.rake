namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Fede",
                 email: "federicofrumento21@hotmail.com",
                 password: "estaba",
                 password_confirmation: "estaba",
                 score: 100)
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
    Area.create!(name:'Negocios')
    Area.create!(name:'Tecnologia e Internet')
    Area.create!(name:'Economia')
    Area.create!(name:'Educacion')
    Area.create!(name:'Automoviles')
    Area.create!(name:'Casa y Jardin')
    Area.create!(name:'Deportes')
    Area.create!(name:'Gastronomia')
    Area.create!(name:'Sociedad y Cultura')
    Area.create!(name:'Turismo')
    Area.create!(name:'Humanidades')
    Area.create!(name:'Ciencias e Ingenieria')
    Area.create!(name:'Arte y Ocio')
    5.times do |n|
      user  = User.find(n+1)
      user.area_users.create!(area_id: n+1)
    end
    5.times do |n|
      titulo  = "Tiulo#{n+1}"
      contenido = "contenido#{n+1}"
      Question.create!(title: titulo,
                   content: contenido,
                   user_id: n+1,
                   area_id: n+1)
    end
  end
end