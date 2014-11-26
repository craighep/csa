# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.transaction do
  1..40.times do |i|
    user = User.create!(surname: "Surname#{i}",
                       firstname: "Firstname#{i}",
                       email: "cwl#{i}@aber.ac.uk",
                       phone: '01970 622422',
                       jobs:      true,
                       grad_year: 1985)
    UserDetail.create!(login: "cwl#{i}",
                       password: 'secret',
                       user: user)
  end
  # Create one special admin user
  user = User.create!(surname: 'Loftus',
                      firstname: 'Chris',
                      email: 'cwl@aber.ac.uk',
                      phone: '01970 622422',
                      grad_year: 1985)
  UserDetail.create!(login: 'admin',
                     password: 'taliesin',
                     user: user)

  # Create one test user
  user = User.create!(surname: 'Craig',
                      firstname: 'Heptinstall',
                      email: 'crh13@aber.ac.uk',
                      phone: '00000000000',
                      grad_year: 2014)
  UserDetail.create!(login: 'craig',
                     password: 'secret',
                     user: user)

  # Create some dummy feeds
  twitter = Feed.create!(name: 'twitter')
  Feed.create!(name: 'facebook')
  email = Feed.create!(name: 'email')
  Feed.create!(name: 'RSS')
  Feed.create!(name: 'atom')

  t = Time.now
  str_time = t.strftime('%H:%M:%S')
  Broadcast.create!(user_id: user,
                    feeds: [twitter, email],
                    content:  "#CraigBakes setup all the cucumbers " + str_time)
end
