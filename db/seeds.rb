# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

Task.destroy_all

User.all.each do |user|
  10.times do
    task = Task.new
    task.name = Faker::Company.bs
    task.description =
      [Faker::Hacker.say_something_smart,
        Faker::Hacker.say_something_smart,
        Faker::Hacker.say_something_smart].join(" ")
    task.assignee_id = User.pluck(:id).sample
    task.creator_id = user.id
    task.deadline = Date.today + rand(14).days
    task.save!
  end
end
