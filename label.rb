class Label
  attr_accessor :items, :title, :color

  def initialize(title, color)
    @id = rand(1..1000)
    @title = title 
    @color = color
    @items = [] 
  end

  def add_item(item)
    @items << item
  end

end