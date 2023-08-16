require 'date'



class Item
  attr_reader :pub_date
  attr_accessor :genre, :id, :archived, :author, :source, :label 

  def initialize(pub_date, archived: false)
    @id = Random.rand(1..200)
    begin
      @pub_date = Date.strptime(pub_date, '%Y-%m-%d')
    rescue ArgumentError
      puts 'Invalid date format. Please use the format YYYY-MM-DD.'
      exit
    end
    @archived = archived    
  end

  def genre=(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include?(self)    
  end

  def author=(author)
    @author = author
    author.add_item(self) unless author.items.include?(self)
  end

  def source=(source)
    @source = source
    source.add_item(self) unless source.items.include?(self)
  end

  def label=(label)
    @label = label
    label.add_item(self) unless label.items.include?(self)
  end

  def can_be_archived?
    @since_pub_date = (Date.today - @pub_date)
    @since_pub_date  >= 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
