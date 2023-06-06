
class Game 
  attr_accessor :title, :genre, :last_played_at

  def initialize(title, genre)
    @title = title
    @genre = genre
    @last_played_at = Time.now
  end

  def can_be_archived?
    super && last_played_at < 2.years.ago
  end
end
