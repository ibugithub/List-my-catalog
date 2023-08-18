require './item'
require './genre'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(pub_date, publisher, cover_state)
    super(pub_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
