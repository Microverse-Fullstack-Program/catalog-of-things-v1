require_relative '../book'

module AddBook
  def add_book(books)
    puts
    puts 'Adding a new book:'
    print 'Please enter the book publisher: '
    publisher = gets.chomp
    print 'Please enter the book cover state [bad, good ...]: '
    cover_state = gets.chomp
    print 'Please enter the book publish date [YYYY/MM/DD]: '
    gets.chomp

    book = Book.new(publisher, cover_state, publish_date)
    books << book
  end
end
