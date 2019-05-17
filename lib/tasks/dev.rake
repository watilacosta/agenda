namespace :dev do
  desc "Cria contatos"
  task setup: :environment do
    # criando os tipos de contatos
    kinds = %w(Amigo Família Profissional)

    kinds.each do |k|
      Kind.create!(
        description: k
      )
    end

    # criando os contatos
    50.times do |i|
      Contact.create!(
        name:      Faker::Name.name,
        email:     Faker::Internet.email,
        birthdate: Faker::Date.between(35.years.ago, 18.years.ago),
        kind: Kind.all.sample
      )
    end
  end

end
