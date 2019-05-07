namespace :dev do
  desc "Cria contatos"
  task setup: :environment do
    500.times do |i|
      Contact.create!(
        name:      Faker::Name.name,
        email:     Faker::Internet.email,
        birthdate: Faker::Date.between(35.years.ago, 18.years.ago),
      )
    end
  end

end
