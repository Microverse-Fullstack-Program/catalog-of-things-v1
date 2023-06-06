class Author < Item
    attr_reader :id, :first_name, :last_name, :items
  
    def initialize(id, first_name = '', last_name = '')
      @id = generate_random_id
      @first_name = first_name
      @last_name = last_name
      @items = []
    end
  
    def generate_random_id
      rand(1..100)
    end
  
    def add_item(item)
      @items << item
      item.author = self
    end
  end
  