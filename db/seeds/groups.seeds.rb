groups = \
[
 {
   name: "First Group",
   code: 0
 }
]
groups.each { |g| Group.create!(g) }
