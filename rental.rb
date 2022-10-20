require_relative './app'
require 'securerandom'
require 'date'

class Rental
  attr_accessor :date, :book, :person, :id

  def initialize(book, person, date = DateTime.now.strftime('%d/%m/%Y'), id = SecureRandom.uuid)
    @id = id
    @date = date
    @book = book
    book.rentals.push(self)
    @person = person
    person.rentals.push(self)
  end

  def self.create_rental(rentals, books, people)
    puts 'Select a book from the following list by number'
    Book.list_books(books)
    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    Person.list_people(people)
    person_index = gets.chomp.to_i

    rental = Rental.new(books[book_index], people[person_index])
    rentals.push(rental)
    puts 'Rental created successfully'
  end

  def self.list_rentals_for_person_id(rentals, people)
    puts 'Select a person from the following list by number (not id)'
    people.each_with_index do |person, index|
      puts "[#{index + 1}] - #{person.name}"
    end
    puts 'ID of person: '
    id = gets.chomp.to_i
    puts ''
    puts '-----------------------------------------------'
    puts 'Rentals:'
    puts ''
    rentals.each do |rental|
      if rental.person.id == people[id - 1].id
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
    puts '-----------------------------------------------'
    puts ''
  end
end
