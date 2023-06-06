class Author
  attr_reader :id, :first_name, :last_name, :items

  def initialize(_id, first_name = '', last_name = '')
    @id = generate_random_id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def generate_random_id
    rand(1..100)
  end

  def add_item(item, game_library)
    @items << item 
    item.author = self
    game_library.authors << self
  end
end