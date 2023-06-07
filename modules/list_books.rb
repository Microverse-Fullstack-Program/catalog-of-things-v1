module ListBooks
  def list_all_books(books)
    puts
    if books.empty?
      puts 'No book found!'
      return
    end

    puts 'Listing all books:'
    @books.each do |book|
      print "Id: #{book.id}, Publisher: #{book.publisher}, Cover State: #{book.cover_state}, "
      puts "Label: #{book.label}, Publish Date: #{book.publish_date}, Archived: #{book.archived}"
    end
    puts
  end
end
