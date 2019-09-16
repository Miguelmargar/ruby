
class Fm
	attr_accessor :name, :sex, :status, :age, :children

	def initialize(name, sex, status, age, children)
		@name = name
		@sex = sex
		@status = status
		@age = age
		@children = children
	end 
end

def parent?(inst)
	
	if inst.sex == "male"
		then desc = "he"
		if inst.children > 0
			then title = "father"
		end

	elsif inst.sex =="female"
		then desc = "she"
		if inst.children > 0
			then title = "mother"
		end
	end

	if inst.age <= 18
		then parent = "no"
	else parent = "yes"
	end

	if parent == "yes"
		then p(desc + " is a " + title)
	else p(desc + " is not a parent")
	end
end
	
def child?(inst)

	if inst.sex == "male"
		then desc, title = "he", "son"
	else desc, title = "she", "daughter"
	end

	if inst.age <= 18
		then child = "yes"
	else child = "no"
	end

	if child == "yes"
		then p(desc + " is a " + title)
	else p(desc + " is not a child")
	end
end



fm1 = Fm.new("John", "male", "married", 65, 3)
fm2 = Fm.new("Mary", "female", "married", 62, 3)
fm3 = Fm.new("Jenny", "female", "underage", 16, 0)
fm4 = Fm.new("Mark", "male", "underage", 14, 0)
fm5 = Fm.new("David", "male", "underage", 12, 0)

puts
p("Now check who are the parents-----------------------------")
parent?(fm1)
parent?(fm2)
parent?(fm3)
parent?(fm4)
parent?(fm5)

puts
p("now check who are the kids--------------------------------")
child?(fm1)
child?(fm2)
child?(fm3)
child?(fm4)
child?(fm5)

puts
p("now print name and status---------------------------------")

all = [fm1, fm2, fm3, fm4, fm5]

all.each { |member| p(member.name + " is " + member.status) }

puts
p("now with do and all info of member------------------------")

all.each do |member|
	p("name: " + member.name + ", sex: " + member.sex + ", status: " + member.status + ", age: " + 		member.age.to_s + ", children: " + member.children.to_s)	
end



