require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state
  attr_reader :id


  def initialize(publisher, cover_state, dictionary)
    super(dictionary)
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_json(*_args)
    {
      id: @id,
      genre: @genre.to_json,
      author: @author,
      source: @source,
      label: @label,
      publish_date: @publish_date,
      archived: @archived,
      publisher: @publisher,
      cover_state: @cover_state
    }
  end

  def to_s
    "Book: #{@id} - #{@label} - By #{@author} - #{@genre.name}"
  end

  def self.create_from_ui
    puts 'Enter the name of the genre'
    genre_name = gets.chomp
    genre = Genre.new(genre_name, [])
    puts 'Enter the name of the author'
    author = gets.chomp

    puts 'Enter the source'
    source = gets.chomp

    puts 'Enter the label'
    label = gets.chomp

    puts 'Enter the publish date'
    publish_date = gets.chomp

    puts 'Enter the archived status'
    archived = gets.chomp == 'true'

    puts 'Enter the publisher'
    publisher = gets.chomp

    puts 'Enter the cover state'
    cover_state = gets.chomp

    dictionary = { 'genre' => genre, 'author' => author, 'source' => source,
                   'label' => label, 'publish_date' => Date.parse(publish_date), 'archived' => archived }

    Book.new(publisher, cover_state, dictionary)
  end

  def list_authors
    if @author_list.empty?
      puts 'Author list is empty'
    else
      @author_list.each_with_index do |author, index|
        puts "(#{index}) ID: #{author.id}"
        puts "Author First Name: #{author.first_name}"
        puts "Author Last Name: \"#{author.last_name}"
      end
    end
  end

  private

  def can_be_archived?
    @archived = if super or @cover_state == 'bad'
                  true
                else
                  false
                end
  end
end
