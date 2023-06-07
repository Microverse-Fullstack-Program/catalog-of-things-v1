require_relative '../author'

module AddAuthor
  def add_author(authors)
    print 'Please enter the author\'s first name: '
    first_name = gets.chomp
    print 'Please enter the author\'s last name: '
    last_name = gets.chomp

    author = Author.new(first_name, last_name)
    authors << author
  end
end
