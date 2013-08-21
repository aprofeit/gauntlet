namespace :populate do
  task objectives: :environment do
    Objective.destroy_all

    10.times do
      Objective.create({
        title: Faker::Lorem.sentence(1).delete('.')
      })
    end
  end

  task people: :environment do
    Person.destroy_all

    15.times do
      Person.create({
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        hire_date: [3, 5, 7].sample.weeks.from_now
      })
    end
  end
end