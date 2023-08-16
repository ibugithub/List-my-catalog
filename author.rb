class Author
  attr_accessor :items, :first_name, :last_name

  def initialize(first_name, last_name)
    @id = rand(1..1000)
    @first_name = first_name 
    @last_name = last_name 
    @items = []
  end

  def add_item(item)
    @items << item
  end


end