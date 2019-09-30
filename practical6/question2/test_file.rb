require_relative 'grand_dad'
require_relative 'dad'
require_relative 'son'

g = Grand_dad.new
d = Dad.new
s = Son.new

p "Checking inheritance from Grand_dad down ------------"
g.talks_job
d.talks_job
s.talks_job

puts

p "Checking inheritance from bottom to up - should give error ------"
s.thinking
d.thinking
g.thinking

