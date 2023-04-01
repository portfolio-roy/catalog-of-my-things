require './music_album'
require './music_data'
require './genre'
require './book'
require './book_data'
require './game'
require './game_data'

class Main
  def display_menu
    puts 'Please choose an option to enter in a number'
    puts '1. List all books'
    puts '2. List all music albums'
    puts '3. List of games'
    puts '5. List all genres (e.g. "Hip Hop", "Rock")'
    puts '6. List all labels (e.g. "Gift", "New")'
    puts '7. List all authors (e.g. "Stephen King", "J.K. Rowling")'
    puts '8. List all sources (e.g. "From a friend", "Amazon")'
    puts '9. Add a book'
    puts '10. Add a music album'
    puts '11. Add a game'
    puts '12. Exit'
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
      1 => proc { load_data(BookData) },
      2 => proc { load_data(MusicAlbumData) },
      3 => proc { load_data(GameData) },
      9 => proc { add_book },
      10 => proc { add_music_album },
      11 => proc { add_game },
      12 => proc { exit_program }
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
