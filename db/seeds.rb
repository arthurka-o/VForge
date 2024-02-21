# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

user = User.create!(email: 'me@arthurka.eu') do |u|
  password = 'qwer1234'
  u.password = password
  u.password_confirmation = password
  u.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'avatar.png')), filename: 'avatar.png')
  u.username = 'Arthur'
end

user.traits.create(name: 'bio', category: :prompt) do |trait|
  trait.value = 'I am a software developer.'
end

user.traits.create(name: 'Games', category: :interest) do |trait|
  trait.value = 'Dota 2'
end

user.traits.create(name: 'Games', category: :interest) do |trait|
  trait.value = Faker::Game.title
end

10.times do
  user = User.create!(email: Faker::Internet.email) do |u|
    password = Faker::Internet.password
    u.password = password
    u.password_confirmation = password

    u.username = Faker::Games::Dota.hero
  end

  user.traits.create(name: 'Bio', category: :prompt) do |trait|
    trait.value = Faker::Games::Dota.quote
  end

  user.traits.create(name: 'Games', category: :interest) do |trait|
    trait.value = 'Dota 2'
  end

  user.traits.create(name: 'Games', category: :interest) do |trait|
    trait.value = Faker::Game.title
  end
end
