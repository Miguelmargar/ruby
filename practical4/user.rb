class User
	attr_accessor :name, :address, :id, :age

	def initialize(name, address, id, age)
		@name = name
		@address = address
		@id = id
		@age = age
		@books_borrowed = []
	end

	def books_on_loan()
		return @books_borrowed
	end

	def add_book_on_loan(book)
		@books_borrowed << book
	end	

	def remove_book_on_loan(book)
		@books_borrowed.delete(book)
	end

end
