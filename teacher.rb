require_relative './person'
require 'securerandom'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name, id = SecureRandom.uuid)
    super(age, name, id,)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def self.create_teacher(people)
    print 'Name: '
    name = gets.chomp

    print 'Age: '
    age = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    people.push(Teacher.new(specialization, age, name))
    puts 'Person created successfully'
  end
end
