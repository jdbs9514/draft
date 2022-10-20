require_relative './book'
require_relative './rental'
require_relative './student'
require_relative './teacher'
require_relative './save_data'
require_relative './load_data'
require_relative './fake_data'
require 'date'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = LoadData.read_books || []
    @people = LoadData.read_people || []
    @rentals = LoadData.read_rentals(@books, @people) || []
  end

  def dashboard
    puts '----- Choose An Option -----'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    puts '---------------------------'
  end

  def option1(input)
    case input
    when '1' then Book.list_books(@books)
    when '2' then Person.list_people(@people)
    when '3' then Person.create_person(@people)
    when '4' then Book.create_book(@books)
    when '5' then Rental.create_rental(@rentals, @books, @people)
    when '6' then Rental.list_rentals_for_person_id(@rentals, @people)
    when '7' then print 'Thank you for using this app!'
    end
  end

  def run
    # put_fake_data(@books, @people, @rentals)

    # run the program
    loop do
      dashboard
      input = gets.chomp
      if input == '7'
        # save data on JSON files when exit the program
        SaveData.save_books(@books)
        SaveData.save_people(@people)
        SaveData.save_rentals(@rentals)
        break
      end

      option1(input)
    end
  end
end
