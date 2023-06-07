require_relative 'book_helper'

class App
  def initialize
    @book_helper = BookHelper.new
  end

  def main_menu
    puts 'Welcome to our catalog, Please select an Option: '
    options = [
      '1 - Books Catalog',
      '2 - MusicsAlbum Catalog',
      '3 - Games Catalog',
      '4 - Quit'
    ]

    loop do
      puts
      puts '------------------------'
      puts options
      puts '------------------------'
      print 'option: '
      option = gets.chomp.to_i
      puts 'Invalid Option' unless [1, 2, 3, 4].include?(option)

      action(option)
    end
  end

  def action(option)
    case option
    when 1
      @book_helper.book_menu(option)
    when 2
      # TODO: implement music album menu
    when 3
    # TODO: implement games menu
    when 4
      @book_helper.book_menu(option)
      puts 'Thank You for using this app!'
      exit 0
    end
  end
end

app = App.new
app.main_menu
