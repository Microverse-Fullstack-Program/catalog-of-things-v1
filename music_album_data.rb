require 'json'
require_relative 'musicalbum'
require_relative 'item'

class MusicAlbumData
  def initialize(filename)
    @filename = filename
    @albums = load_data || []
  end

  def display_menu
    puts 'Welcome please choose an option'
    puts '1- List all albums:'
    puts '2- List all genres:'
    puts '3- add and album:'
    puts '4- Quit:'
  end

  def list_all_albums
    if @albums.empty?
      puts ' No amlbums found! please add one '
    else
      puts 'Album details'
      @albums.each do |album|
        puts "Album title: #{album.name} :: Release year: #{album.publish_date.year} :: Music genre: #{album.genres} "
      end
      puts
    end
  end

  def list_all_genres
    genres = @albums.map(&:genres).flatten.uniq
    if genres.empty?
      puts 'No genres found in the catalog'
    else
      genres.each do |genre|
        puts "#{genre}\n"
      end
    end
  end

  def add_album
    print ' Enter album title: '
    name = gets.chomp
    print 'Enter date of release (YYYY-M-D): '
    publish_date = gets.chomp
    print 'Album listed on spotify? (Y/N): '
    on_spotify = gets.chomp.downcase == 'y'
    print ' Enter the genre of the album music: '
    genres = gets.chomp
    album = MusicAlbum.new(name, publish_date, on_spotify: on_spotify, genres: genres)
    @albums << album
    puts "Album '#{album.name}' Added successfully"
    save_data
  end

  def run
    app = App.new
    loop do
      display_menu
      option = gets.chomp.to_i
      case option
      when 1
        list_all_albums
      when 2
        list_all_genres
      when 3
        add_album
      when 4
        puts ' Thanks for using our service '
        return app.main_menu
      else
        puts 'You Entred an Invalid option'
        return run
      end
    end
  end

  private

  def load_data
    if File.exist?(@filename)
      data = JSON.parse(File.read(@filename))
      data.map do |album_details|
        MusicAlbum.new(album_details['name'], album_details['publish_date'], on_spotify: album_details['on_spotify'],
                                                                             genres: album_details['genres'])
      end
    else
      []
    end
  end

  def save_data
    File.write(@filename, JSON.generate(@albums.map(&:to_h)))
  end
end
