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
        kind:      Kind.all.sample
      )
      puts "#{Contact.all.count} contatos criados!"
    end

    # criando phones
    Contact.all.each do |c|
      Random.rand(5).times do |t|
        phone = Phone.create!(number: Faker::PhoneNumber.cell_phone)
        c.phones << phone
        c.save!
      end
    end

    # criando address
    Contact.all.each do |c|
      Address.create!(
        street:  Faker::Address.street_name,
        city:    Faker::Address.city,
        contact: c
      )
    end
  end

end
