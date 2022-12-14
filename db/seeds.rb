# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

12.times do |i|
  User.create(email: "free_#{i+1}@example.com",
              password: "m@keTh1ng$",
              password_confirmation: "m@keTh1ng$",
              confirmed_at: 1.hour.ago)
              # dark_theme: i % 2 == 1 ? true : false)
end

2.times do |i|
  member = User.create(email: "member_#{i+1}@example.com",
                       password: "m@keTh1ng$",
                       password_confirmation: "m@keTh1ng$",
                       confirmed_at: 1.hour.ago)
  member.add_role 'member'
  member.remove_role 'visitor'
end

2.times do |i|
  admin = User.create(email: "admin_#{i+1}@example.com",
                      password: 'm@keTh1ng$',
                      password_confirmation: "m@keTh1ng$",
                      confirmed_at: 1.hour.ago)
  admin.add_role 'admin'
  admin.remove_role 'visitor'
end

2.times do |i|
  superadmin = User.create(email: "superadmin_#{i+1}@example.com",
                           password: 'm@keTh1ng$',
                           password_confirmation: "m@keTh1ng$",
                           confirmed_at: 1.hour.ago)
  superadmin.add_role 'superadmin'
  superadmin.remove_role 'visitor'
end

2.times do |i|
  sysadmin = User.create(email: "sysadmin_#{i+1}@example.com",
                         password: 'm@keTh1ng$',
                         password_confirmation: "m@keTh1ng$",
                         confirmed_at: 1.hour.ago)
  sysadmin.add_role 'superadmin'
  sysadmin.add_role 'sysadmin'
  sysadmin.remove_role 'visitor'
end

User.all.each do |u|
  2.times do |i|
    u.articles.create(title: "Article #{i+1}", text: "Seed article text.")
  end
end

# User.all.each do |u|
#   4.times do |i|
#     u.todo_items.create(title: "Seed Item #{i+1} for #{u.email}", complete: i % 2 == 0 ? true : false  )
#   end
# end
