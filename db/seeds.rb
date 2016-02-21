# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
   Admin.create(id: "1", name: "Pranav K", email: "pkulkar5@ncsu.edu", password: "1", created_at: "2016-02-12 23:11:54.405191", updated_at: "2016-02-14 01:12:35.667767")
   Student.create(id: "1", name: "Vivek R", email: "v@ncsu.edu", password: "1", created_at: "2016-02-12 23:11:54.405191", updated_at: "2016-02-14 01:12:35.667767")
   Instructor.create(id: "1", name: "Ed Gehringer", email: "e@ncsu.edu", password: "1", created_at: "2016-02-12 23:11:54.405191", updated_at: "2016-02-14 01:12:35.667767")
#   Mayor.create(name: 'Emanuel', city: cities.first)

