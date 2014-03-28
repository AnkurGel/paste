# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(username: 'anonymous', name: 'anonymous', provider: 'system')
[['rb', 'Ruby'],
 ['py', 'Python'],
 ['js', 'Javascript'],
 ['coffee', 'CoffeeScript'],
 ['', 'Plain'],
 ['md', 'Markdown'],
 ['css', 'CSS'],
 ['cpp', 'C++'],
 ['c', 'C'],
 ['java', 'Java'],
].each do |ext, name|
   Language.create(extension: ext, name: name)
 end
