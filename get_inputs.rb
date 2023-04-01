require './get_genre'
def common_inputs
  puts 'Enter the name of the genre'
  genre_name = gets.chomp
  genre = get_genre(genre_name)
  puts 'Enter the name of the author'
  author = gets.chomp
  puts 'Enter the source'
  source = gets.chomp
  puts 'Enter the label'
  label = gets.chomp
  puts 'Enter the publish date'
  publish_date = gets.chomp
  puts 'Enter the archived status'
  archived = gets.chomp == 'false'
  [genre, author, source, label, publish_date, archived]
end

def book_inputs
  puts 'Enter the publisher'
  publisher = gets.chomp
  puts 'Enter the cover state'
  cover_state = gets.chomp
  [publisher, cover_state]
end

def music_album_inputs
  puts 'Enter the spotify status'
  gets.chomp == 'true'
end

def game_inputs
  puts 'Enter the multiplayer status'
  multiplayer = gets.chomp == 'true'
  puts 'Enter the last played date'
  last_played_at = gets.chomp
  [multiplayer, last_played_at]
end

def get_inputs(item_type)
  genre, author, source, label, publish_date, archived = common_inputs
  if item_type == 'book'
    publisher, cover_state = book_inputs
  elsif item_type == 'music'
    on_spotify = music_album_inputs
  else
    multiplayer, last_played_at = game_inputs
  end
  dictionary = { 'genre' => genre, 'author' => author, 'source' => source,
                 'label' => label, 'publish_date' => publish_date, 'archived' => archived }
  if item_type == 'book'
    Book.new(publisher, cover_state, dictionary)
  elsif item_type == 'music'
    MusicAlbum.new(dictionary, on_spotify)
  else
    Game.new(multiplayer, last_played_at, dictionary)
  end
end
