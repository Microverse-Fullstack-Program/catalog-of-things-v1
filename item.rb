require 'date'

class Item
  attr_reader :id, :archived
  attr_accessor :genre, :author, :source, :label, :publish_date

  def initialize(publish_date = nil)
    @id = Random.rand(1..1000)
    @genre = nil
    @author = nil
    @source = nil
    @label = nil
    @publish_date = publish_date
    @archived = false
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    return false if @publish_date.nil? || @publish_date == 'N/A'

    return true if (Date.today.year - Date.parse(@publish_date.to_s).year) > 10

    false
  end
end
