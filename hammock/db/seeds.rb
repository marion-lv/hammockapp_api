# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
courses = [{
  "name": "The joy of physics",
  "provider": "Coursera",
  "status": "interested",
  "id": "1"
  },
  {
  "name": "The joy of maths",
  "provider": "Udacity",
  "status": "in progress",
  "id": "2"
  },
  {
  "name": "The joy of programming",
  "provider": "Coursera",
  "status": "complete",
  "id": "3"
  }]


user = User.new(email: 'email@email.com', password: 'password', password_confirmation: 'password', confirmed_at: Time.zone.now, name: 'Emma' )
user.save

courses.each do |course|
  course = Course.new(name: course[:name], provider: course[:provider], status: course[:status], user_id: user.id)
  course.save
end
