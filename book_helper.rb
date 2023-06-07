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

  def book_menu(option)
    loop do
      if option == 4
        write_book(@books)
        write_label(@labels)
        break
      else
        puts
        puts 'Welcome to Books catalog, Please select an Option: '
        options = ['1 - List All Books', '2 - List All Labels', '3 - Add Book', '4 - Add Label',
                   '5 - Back to Main Menu']

        puts '------------------------'
        puts options
        puts '------------------------'
        print 'option: '
        selected_option = gets.chomp.to_i
        puts 'Invalid Option, Back to Main Menu' unless [1, 2, 3, 4, 5].include?(selected_option)

        break if selected_option == 5

        perform_action(selected_option)
      end
    end
  end

  def perform_action(selected_option)
    case selected_option
    when 1
      list_all_books(@books)
    when 2
      list_all_labels(@labels)
    when 3
      add_book(@books)
    when 4
      add_label(@labels)
    end
  end
end
