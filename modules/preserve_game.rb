require 'JSON'

module PreserveGame
  def write_game(games)
    file = File.open('./data/game.json', 'w+')

    game_hash = {}
    games.each_with_index do |game, index|
      game_hash[(index + 1).to_s] =
                                {
                                    'game' => game.title, 
                                    'genre' => game.genre,
                                    'author' => game.author,
                                    'last_played_at' => Time.now
                                    'archived' => game.archived 
                                }
    end
    file.write(JSON.pretty_generate(game_hash))
  end

  def read_game(games)
    file = File.open('./data/game.json', 'r') if File.exist?('./data/game.json')
    return false if file.nil?

    return unless file.size.positive?

    game_record = JSON.parse(file.read)
    games_record.each do |_key, game|
      games << Game.new(game['title'], game['genre'], game['author'], game['last_played_at'])
    end
  end
