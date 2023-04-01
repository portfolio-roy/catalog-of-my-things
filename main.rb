require './music_album'
require './music_data'
require './genre'
require './book'
require './book_data'
require './game'
require './game_data'
require './item_data'

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

  def load_book
    puts ItemData.load('book')
  end

  def load_music_album
    puts ItemData.load('music_album')
  end

  def load_game
    puts ItemData.load('game')
  end

  def add_book
    ItemData.add_item('book', Book.create_from_ui)
    puts 'Book added'
  end

  def add_music_album
    ItemData.add_item('music_album', MusicAlbum.create_from_ui)
    puts 'Music album added'
  end

  def add_game
    ItemData.add_item('game', Game.create_from_ui)
    puts 'Game added'
  end

  def exit_app
    puts 'Thank you for using this app!'
    exit
  end

  def init_hash
    {
      1 => method(:load_book),
      2 => method(:load_music_album),
      3 => method(:load_game),
      9 => method(:add_book),
      10 => method(:add_music_album),
      11 => method(:add_game),
      12 => method(:exit_app)
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
