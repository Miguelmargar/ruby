class Library

	def initialize()
		@books_held = []
		@accepted_users = []
	end

	def show_books_held()
		p(@books_held)
	end

	def show_accepted_users()
		p(@accepted_users)
	end

	def add_new_book(new_book)
		@books_held << new_book
	end

	def remove_book(book)
		@books_held.delete(book)
	end

	def add_accepted_user(user)
		@accepted_users << user
	end

	def remove_accepted_user(user)
		@accepted_users.delete(user)
	end

	def borrow_book(id, user_name)
		transaction = false
		@books_held.each do |book|
			if book.id == id && book.quantity > 0
				@accepted_users.each do |user|
					if user.name == user_name
						then 
							book.quantity -= 1
							user.add_book_on_loan(book)
							transaction = true
							p("Book registered as loaned")
					end
				end
			end
		end
		if transaction == false
			then p("Error trying to loan book")
		end
	end

	def return_book(id, user_name)
		transaction = false
		@books_held.each do |book|
			if book.id == id && book.quantity < 5
				@accepted_users.each do |user|
					if user.name == user_name	
						then
							book.quantity += 1
							user.remove_book_on_loan(book)
							transaction = true
							p("Book registered as returned")
					end
				end
			end
		end
		if transaction == false
			then p("Error returning the book")
		end
	end


end
