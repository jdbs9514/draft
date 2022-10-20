require_relative './rental'
require 'securerandom'

class Book
  attr_accessor :title, :author, :rentals, :id

  def initialize(title, author, id = SecureRandom.uuid)
    @id = id
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
    @rentals.push(rental)
    rental.book = self
  end

  # list all books
  def self.list_books(books)
    books.each_with_index do |book, index|
      puts "#{index}) -> Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def self.create_book(books)
    print 'Book Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    books.push(book)
    puts 'Book created successfully'
  end
end
