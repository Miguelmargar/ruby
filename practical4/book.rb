class Book
	attr_accessor :title, :author, :id, :year, :quantity

	def initialize(title, author, id, year, quantity)
		@title = title
		@author = author
		@id = id
		@year = year
		@quantity = quantity
	end
end
