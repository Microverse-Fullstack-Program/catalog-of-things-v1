require 'JSON'

module PreserveBook
  def write_book(books)
    file = File.open('./data/book.json', 'w+')

    book_hash = {}
    books.each_with_index do |book, index|
      book_hash[(index + 1).to_s] = { 'id'=>book.id ,'publisher' => book.publisher, 'cover_state' => book.cover_state,
      'label' => book.label, 'publish_date' => book.publish_date, 'archived' => book.archived }
    end
    file.write(JSON.pretty_generate(book_hash))
  end

  def read_book(books)
    file = File.open('./data/book.json', 'r') if File.exist?('./data/book.json')
    return false if file.nil?

    return unless file.size.positive?

    books_record = JSON.parse(file.read)
    books_record.each do |_key, book|
      books << Book.new(book['publisher'], book['cover_state'], book['label'], book['publish_date'])
    end
  end
end