require_relative "book"
require_relative "user"
require_relative "library"

book1 = Book.new("The Cook", "Miguel", 001, 1982, 5)
book2 = Book.new("The Thug", "Avik", 002, 1983, 5)
book3 = Book.new("The Studious", "Rafael", 003, 1984, 5)
book4 = Book.new("The Sharp", "Giovanni", 004, 1985, 5)
book5 = Book.new("The Sound", "John", 005, 1985, 5)

user1 = User.new("Mig", "Dublin 8", 1, 37)
user2 = User.new("Avi", "Stillorgan", 2, 25)
user3 = User.new("Raf", "Rathfarnham", 3, 27)

library1 = Library.new()

puts
p("check state of library to begin with")
library1.show_books_held()
library1.show_accepted_users()

# Add books to library
library1.add_new_book(book1)
library1.add_new_book(book2)
library1.add_new_book(book3)
library1.add_new_book(book4)
library1.add_new_book(book5)

# Add users to library
library1.add_accepted_user(user1)
library1.add_accepted_user(user2)
library1.add_accepted_user(user3)

puts
p("check state of library after additions")
library1.show_books_held()
library1.show_accepted_users()

puts
p("Carry out a borrowing of a book and show state of library")
library1.borrow_book(001, "Mig")
# First book should have 4 copies after the below
library1.show_books_held()
# First book has 4 copies when checked

puts
# Check the books that the user has borrowed
p(user1.name + " has borrowed the following books:")
p(user1.books_on_loan)

puts
# Now return the book and check
# First book should be back to 5 copies after the below
library1.return_book(001, "Mig")
library1.show_books_held()
# First book has 5 copies when checked





















