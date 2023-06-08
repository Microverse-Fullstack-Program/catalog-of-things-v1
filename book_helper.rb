require_relative './modules/add_book'
require_relative './modules/add_label'
require_relative './modules/list_books'
require_relative './modules/list_labels'
require_relative './modules/preserve_book'
require_relative './modules/preserve_label'
require_relative './book'
require_relative './label'

class BookHelper
  include AddBook
  include AddLabel
  include ListBooks
  include ListLabels
  include PreserveBook
  include PreserveLabel

  attr_accessor :books, :labels

  def initialize
    @books = []
    @labels = []
    read_book(@books)
    read_label(@labels)
  end

  def book_menu()
    puts
    puts 'Welcome to Books catalog, Please select an Option: '
    loop do
      options = [
        '1 - List All Books', '2 - List All Labels',
        '3 - Add Book', '4 - Back to Main Menu',
        '5 - Quit'
      ]

      puts '------------------------'
      puts options
      puts '------------------------'
      print 'option: '
      choice = gets.chomp.to_i

      if choice == 4
        write_file
        puts 'You Are Back to Main Menu'
        break
      end

      perform_action(choice)
    end
  end

  def perform_action(option)
    case option
    when 1
      list_all_books(@books)
    when 2
      list_all_labels(@labels)
    when 3
      add_book(@books)
      add_label(@labels)
    when 5
      write_file
      exit 0
    else
      puts 'Invalid Option, try again!'
    end
  end

  def write_file
    write_book(@books)
    write_label(@labels)
    puts 'Thank You for using this app!'
  end
end
