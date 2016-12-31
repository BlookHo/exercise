# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
User.reset_pk_sequence
User.create([
  { username: 'Aleksei', email: 'zoneiva@gmail.com' },
  { username: 'Peter', email: 'cts@gmail.com' },
  { username: 'Ann', email: 'anna@mail.ru' },
  { username: 'Example User', email: 'example@railstutorial.org' },
  { username: 'Feodor', email: 'fedor@yandex.ru' }
])

GroupEvent.delete_all
GroupEvent.reset_pk_sequence
GroupEvent.create([
  { user_id: 1, start: '2017-01-20 10:00:00', stop: '2017-01-22 18:00:00', duration: 2, name: 'Developers Meeting', description: '#### Fine meeting with developers in office [www.blog.com](my_email@google.com)!', markdown_description: '', location: 'Tokyo', published: true, deleted: false },
  { user_id: 2, start: '2017-01-12 18:00:00', stop: '2017-01-12 22:00:00', duration: 1, name: 'Dinner', description: '#### Dinner in fine restaurant near Coliseum', markdown_description: '', location: 'Rome', published: false, deleted: false },
  { user_id: 1, start: '2017-02-15 10:00:00', stop: '2017-02-25 18:00:00', duration: 10, name: 'Coding', description: '#### Developing of main * Back-end * Front end * Server tech in Project#22 in office', markdown_description: '', location: 'Minsk', published: true, deleted: false },
  { user_id: 1, start: '2017-03-05 14:30:00', stop: '2017-03-10 19:00:00', duration: 5, name: '', description: '#### Fine meeting with developers in office ', markdown_description: '', location: 'Tokyo', published: false, deleted: false },
  { user_id: 2, start: '2017-02-10 9:00:00', stop: '2017-02-13 22:00:00', duration: 3, name: 'Weekend', description: '#### Great weekend of the whole team', markdown_description: '', location: 'Paris', published: true, deleted: false },
  { user_id: 1, start: '2017-01-25 11:00:00', stop: '2017-03-23 19:00:00', duration: 55, name: 'Startup Launch', description: '#### Launch of new startup according to the [Project_15.com]', markdown_description: '', location: 'Boston', published: true, deleted: false },
  { user_id: 3, start: '2017-04-01 10:00:00', stop: '2017-05-15 19:00:00', duration: 45, name: 'Team Ruby Learning', description: '', markdown_description: '', location: 'Sevilla', published: false, deleted: false },
  { user_id: 1, start: '2017-04-20 12:30:00', stop: '2017-04-24 18:30:00', duration: 4, name: 'React Conference', description: '', markdown_description: '', location: 'New York', published: false, deleted: false }
])
