require_relative '../game'

module AddGame
  def add_game(games)
    puts 'Adding a new game:'
    print 'Please enter the game title: '
    title = gets.chomp
    print 'Please enter the game genre: '
    genre = gets.chomp
    print 'Please enter the game author: '
    author = gets.chomp
    game = Game.new(title, genre, author)
    games << game
  end
end
