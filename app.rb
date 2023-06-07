require 'json'
require_relative 'musicalbum'
require_relative 'music_album_data'

class App
  def main_menu
    puts 'Welcome to our catalog, Please select an Option: '
    options = [
      '1 - List All Books',
      '2 - Music albums catalog',
      '3 - List All Games',
      '4 - Quit'
    ]
    puts options
    option = gets.chomp.to_i
    case option
    when 2
      album = MusicAlbumData.new('./data/albums.json')
      album.run
    else
      puts 'Invalid choice'
      main_menu
    end
  end
end

app = App.new
app.main_menu
