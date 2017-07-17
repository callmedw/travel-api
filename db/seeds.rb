# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



class Seed

  def self.begin
    seed = Seed.new
    seed.generate_destinations
  end

  def generate_destinations
    30.times do |i|
      destination = Destination.create!(
        location: Faker::Address.city,
      )

      3.times do |i|
        destination.reviews.create(author: Faker::Food.spice, body: Faker::Simpsons.quote, rating: Faker::Number.between(1,5))
      end
    end
  end
end

Seed.begin
