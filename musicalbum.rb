require_relative './item'
require 'date'
require_relative './genre'

class MusicAlbum < Item
  attr_accessor :name, :genres, :publish_date, :on_spotify
  attr_writer :genre

  def initialize(name, publish_date, on_spotify: false, genres: [])
    super()
    @name = name
    @publish_date = Date.parse(publish_date)
    @on_spotify = on_spotify
    @genres = genres
  end

  def can_be_archived?
    super && @on_spotify
  end

  def add_genre(genre)
    @genres << genre
  end

  def to_h
    {
      name: @name,
      publish_date: @publish_date.iso8601,
      on_spotify: @on_spotify,
      genres: @genres
    }
  end
end
