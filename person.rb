require_relative './nameable'
require_relative './decorator'
require_relative './capitalize'
require_relative './trimmer'
require 'securerandom'

class Person < Nameable
  attr_accessor :name, :id, :age, :rentals, :parent_permission

  def initialize(age, name, id, parent_permission: true)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  # list all people
  def self.list_people(people)
    people.each_with_index do |person, index|
      puts "#{index}) -> Type: #{person.class}, Name: \"#{person.name}\", Age: #{person.age}, ID: #{person.id}"
    end
  end

  # User create a person method (teacher or student)
  def self.create_person(people)
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]'
    person_type = gets.chomp

    case person_type
    when '1'
      Student.create_student(people)
    when '2'
      Teacher.create_teacher(people)
    else
      puts 'Invalid option test'
      nil
    end
  end

  private

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  def of_age?
    @age >= 18
  end
end

# person = Person.new(22, 'maximilianus')
# person.correct_name
# capitalized_person = CapitalizeDecorator.new(person)
# capitalized_person.correct_name
# capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
# capitalized_trimmed_person.correct_name
