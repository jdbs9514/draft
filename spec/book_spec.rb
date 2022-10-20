require_relative './book'
require_relative './app'

describe Book do
  context 'testing the Book class' do
    book = Book.new('Tokio blues', 'Haruki murakami')

    it 'takes two parameters and return a book object' do
      expect(book.class) == Book
    end

    it 'return the correct values of parameters' do
      expect(book.title).to eq 'Tokio blues'
      expect(book.author).to eq 'Haruki murakami'
    end

    it 'check if we get the rental method in one instance of the class book' do
      expect(Book.instance_methods(false).include?(:add_rental)).to eq true
    end
  end
end
