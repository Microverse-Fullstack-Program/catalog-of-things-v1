class Game
  attr_accessor :title, :genre, :last_played_at
  attr_writer :author

  def initialize(title, genre, author)
    @title = title
    @genre = genre
    @last_played_at = Time.now
    @author = author
  end

  def author=(author)
    @author = author
  end

  def can_be_archived?
    super() && last_played_at < 2.years.ago
  end
end
