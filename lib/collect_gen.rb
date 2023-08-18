class Collect
  def collect_gen_info(item)
    puts 'insert the publish date, use this format : yyyy-mm-dd'
    pub_date = gets.chomp

    puts "genre of the #{item}?"
    genre = gets.chomp

    puts 'first name of the author?'
    first_name_author = gets.chomp

    puts 'last name of the author?'
    last_name_author = gets.chomp

    puts "source of the #{item}?"
    source = gets.chomp

    puts "label of the #{item}?"
    label = gets.chomp

    puts "label color of the #{item}?"
    label_color = gets.chomp

    [pub_date, genre, first_name_author, last_name_author, source, label, label_color]
  end
end
