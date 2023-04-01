require './music_album'
require './genre'
require './book'
require './game'
require './item_data'

class Main
  def display_menu
    puts 'Please choose an option to enter in a number'
    puts '1. List all books'
    puts '2. List all music albums'
    puts '3. List of games'
    puts '4. List all genres (e.g. "Hip Hop", "Rock")'
    puts '5. List all labels (e.g. "Gift", "New")'
    puts '6. List all authors (e.g. "Stephen King", "J.K. Rowling")'
    puts '7. List all sources (e.g. "From a friend", "Amazon")'
    puts '8. Add a book'
    puts '9. Add a music album'
    puts '10. Add a game'
    puts '11. Exit'
  end

  def load_book
    puts ItemData.load('book')
  end

  def load_music_album
    puts ItemData.load('music_album')
  end

  def load_game
    puts ItemData.load('game')
  end

  def list_genres
    MusicAlbum.list_genres
  end

  def list_labels
    Item.list_labels
  end

  def list_sources
    Item.list_sources
  end

  def list_authors
    Book.list_authors
  end

  def add_book_item
    ItemData.add_item('book', Book.create_from_ui)
    puts 'Book added'
  end

  def add_music_album_item
    ItemData.add_item('music_album', MusicAlbum.create_from_ui)
    puts 'Music album added'
  end

  def add_game_item
    ItemData.add_item('game', Game.create_from_ui)
    puts 'Game added'
  end

  def exit_app
    puts 'Thank you for using this app!'
    exit
  end

  # Method to load data
  def load_data(data)
    puts data.load
  end

  # Method to add a book
  def add_book
    BookData.add_book(Book.create_from_ui)
    puts 'Book added'
  end

  # Method to add a music album
  def add_music_album
    MusicAlbumData.add_music_album(MusicAlbum.create_from_ui)
    puts 'Music album added'
  end

  # Method to add a game
  def add_game
    GameData.add_game(Game.create_from_ui)
    puts 'Game added'
  end

  # Method to exit the program
  def exit_program
    puts 'Thank you for using this app!'
    exit
  end

  # Method to initialize the hash
  def init_hash
    {
      1 => method(:load_book),
      2 => method(:load_music_album),
      3 => method(:load_game),
      4 => method(:list_genres),
      5 => method(:list_labels),
      6 => method(:list_authors),
      7 => method(:list_sources),
      8 => method(:add_book),
      9 => method(:add_music_album),
      10 => method(:add_game),
      11 => method(:exit_app)
    }
  end

  def run
    puts 'Welcome to Catologue App'

    loop do
      display_menu
      option = gets.chomp.to_i

      puts init_hash[option].call
      puts "\n"
    end
  end
end

Main.new.run
