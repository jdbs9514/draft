def put_fake_data(books, people, rentals)
  # put FAKE DATA into @books array and @people array
  books_dummy_data = [
    ['The Grass is Always Greener', 'Jeffrey Archer'],
    ['Murder!', 'Arnold Bennett'],
    ['A Boy at Seven', 'John Bidwell'],
    ['The Open Boat', 'Stephen Crane'],
    ['The Higgler', 'A. E. Coppard']
  ]
  books_dummy_data.each do |book|
    books.push(Book.new(book[0], book[1]))
  end
  students_names = %w[John Ana Kevin]
  students_names.each do |name|
    people.push(Student.new('Alpha', 22, name, parent_permission: true))
  end
  teachers_names = %w[Clark Julia Paul]
  teachers_names.each do |name|
    people.push(Teacher.new('Ruby', 22, name))
  end
  # put FAKE DATA into @rentals
  people.each do |person|
    books.each do |book|
      rentals.push(Rental.new(book, person))
    end
  end
end
