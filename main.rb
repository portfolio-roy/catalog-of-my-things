require './music_album'
require './music_data'
require './genre'
require './book'
require './book_data'

class Main
  def display_menu
    puts 'Please choose an option to enter in a number'
    puts '1. List all books'
    puts '2. List all music albums'
    puts '3. List all movies'
    puts '4. List of games'
    puts '5. List all genres (e.g. "Hip Hop", "Rock")'
    puts '6. List all labels (e.g. "Gift", "New")'
    puts '7. List all authors (e.g. "Stephen King", "J.K. Rowling")'
    puts '8. List all sources (e.g. "From a friend", "Amazon")'
    puts '9. Add a book'
    puts '10. Add a music album'
    puts '11. Add a movie'
    puts '12. Add a game'
    puts '13. Exit'
  end

  def init_hash
    {
      1 => proc {
             puts BookData.load
           },
      2 => proc {
             puts MusicAlbumData.load
           },
      9 => proc {
             BookData.add_book(Book.create_from_ui)
             puts 'Book added'
           },
      10 => proc {
              MusicAlbumData.add_music_album(MusicAlbum.create_from_ui)
              puts 'Music album added'
            },
      13 => proc {
        puts 'Thank you for using this app!'
        exit
      }
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
