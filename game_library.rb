require_relative 'game'
require_relative 'author'

class GameLibrary
  attr_accessor :games, :authors

  def initialize
    @games = []
    @authors = []
  end

  def list_games
    if games.empty?
      puts 'No games found.'
    else
      puts 'List of games:'
      games.each do |game|
        puts "- #{game.title} (Genre: #{game.genre}, Last Played: #{game.last_played_at})"
      end
    end
  end

  def list_authors
    if authors.empty?
      puts 'No authors found.'
    else
      puts 'List of authors:'
      authors.each do |author|
        puts "- #{author.first_name} #{author.last_name}"
      end
    end
  end

  def add_game(title, genre, author)
    game = Game.new(title, genre, author)
    games << game
    puts "#{game.title} added to the game library."
  end
end
