require_relative './modules/add_book'
require_relative './modules/add_label'
require_relative './modules/list_books'
require_relative './modules/list_labels'
require_relative './book'
require_relative './label'

class BookHelper
  include AddBook
  include AddLabel
  include ListBooks
  include ListLabels

  attr_accessor :books, :labels

  def initialize
    @books = []
    @labels = []
  end

  def book_menu(option)
    case option
    when 1
      list_all_books(@books)
    when 2
      list_all_labels(@labels)
    when 5
      add_book(@books)
    when 6
      add_label(@labels)
    else
      puts 'Invalid Option'
    end
  end
end
