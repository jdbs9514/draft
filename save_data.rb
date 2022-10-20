require 'json'

class SaveData
  def self.save_books(books)
    file_path = './DATA/books.json'
    if books.empty? && File.exist?(file_path)
      File.delete(file_path) # delete existing file if books is empty (there is no entries)
    end
    return if books.empty? # do nothing more if people is empty

    File.new(file_path, 'w') unless File.exist?(file_path) # create a file if it doesn't exist
    books_data = []
    books.each do |book| # transform object into array of hashes
      rentals_ids = []
      book.rentals.each { |rental| rentals_ids.push(rental.id) }
      books_data.push({
                        id: book.id,
                        title: book.title,
                        author: book.author,
                        rentals: rentals_ids
                      })
    end
    File.write(file_path, JSON.pretty_generate(books_data))
  end

  def self.save_people(people)
    file_path = './DATA/people.json'
    File.delete(file_path) if people.empty? && File.exist?(file_path)
    return if people.empty?

    File.new(file_path, 'w') unless File.exist?(file_path)
    people_data = []
    people.each do |person|
      rentals_ids = []
      person.rentals.each { |rental| rentals_ids.push(rental.id) }

      if person.instance_of?(Student)
        people_data.push({
                           id: person.id,
                           type: person.class,
                           name: person.name,
                           age: person.age,
                           parent_permission: person.parent_permission,
                           rentals: rentals_ids,
                           classroom: person.classroom
                         })
      elsif person.instance_of?(Teacher)
        people_data.push({
                           id: person.id,
                           type: person.class,
                           name: person.name,
                           age: person.age,
                           rentals: rentals_ids,
                           specialization: person.specialization
                         })
      end
    end
    File.write(file_path, JSON.pretty_generate(people_data))
  end

  def self.save_rentals(rentals)
    file_path = './DATA/rentals.json'
    File.delete(file_path) if rentals == [] && File.exist?(file_path)
    return if rentals.empty?

    File.new(file_path, 'w') unless File.exist?(file_path)
    rentals_data = []
    rentals.each do |rental|
      rentals_data.push({
                          id: rental.id,
                          date: rental.date,
                          book_id: rental.book.id,
                          person_id: rental.person.id
                        })
    end
    File.write(file_path, JSON.pretty_generate(rentals_data))
  end
end
