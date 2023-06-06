require 'date'

class Item
  attr_accessor :genre
  attr_reader :id, :author, :source, :label, :publish_date, :archived

  def initialize(id = Random.rand(1..1000))
    @id = id
    @genre = nil
    @author = nil
    @source = nil
    @label = nil
    @publish_date = nil
    @archived = false
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    (Date.today.year - @publish_date.year) > 10
  end
end
