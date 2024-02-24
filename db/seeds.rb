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

user = User.create! do |u|
  password = 'qwer1234'

  u.email = 'a@a.com'
  u.password = password
  u.password_confirmation = password
end

profile = Profile.create!(user: user) do |p|
  p.username = 'Arthur Arwell'
  p.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'avatar.png')), filename: 'avatar.png')
end

profile.traits.create(name: 'bio', category: :prompt) do |trait|
  trait.value = 'I drizzle my jizzle'
end

profile.traits.create(category: :interest, name: 'Games', value: 'Dota 2', emoji: Emoji.find_by_alias('computer_mouse').raw)
profile.traits.create(category: :interest, name: 'Games', value: 'CS 2', emoji: Emoji.find_by_alias('gun').raw)
profile.traits.create(category: :interest, name: 'Games', value: 'Minecraft', emoji: Emoji.find_by_alias('pick').raw)
profile.traits.create(category: :interest, name: 'Games', value: 'Lethal Company', emoji: Emoji.find_by_alias('performing_arts').raw)

profile.traits.create(category: :basic, name: 'Looking for', value: 'Playmate', emoji: Emoji.find_by_alias('video_game').raw)
profile.traits.create(category: :basic, name: 'Language', value: 'Russian', emoji: Emoji.find_by_alias('ru').raw)
profile.traits.create(category: :basic, name: 'Language', value: 'English', emoji: Emoji.find_by_alias('uk').raw)
profile.traits.create(category: :basic, name: 'Language', value: 'Polish', emoji: Emoji.find_by_alias('poland').raw)
profile.traits.create(category: :basic, name: 'Timezone', value: 'CET', emoji: Emoji.find_by_alias('eu').raw)

10.times do
  user = User.create!(email: Faker::Internet.email) do |u|
    password = Faker::Internet.password
    u.password = password
    u.password_confirmation = password
  end

  profile = Profile.create!(user: user, username: Faker::Games::Dota.hero)

  profile.traits.create(name: 'Bio', category: :prompt) do |trait|
    trait.value = Faker::Games::Dota.quote
  end

  profile.traits.create(name: 'Games', category: :interest) do |trait|
    trait.value = 'Dota 2'
  end

  profile.traits.create(name: 'Games', category: :interest) do |trait|
    trait.value = Faker::Game.title
  end
end
