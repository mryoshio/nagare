users = \
[
 {
   group_id: Group.first.id,
   name: "Mike Davis",
   email: "mike@example.com",
   password: "mikemike55",
   password_confirmation: "mikemike55"
 }
]
users.each { |u| User.create!(u) }
