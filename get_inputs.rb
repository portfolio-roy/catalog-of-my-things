require './get_genre'
def get_inputs(item_type)
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
    
    if item_type == 'book'
        puts 'Enter the publisher'
        publisher = gets.chomp

        puts 'Enter the cover state'
        cover_state = gets.chomp
    end

    if item_type == 'music_album'
        puts 'Enter the spotify status'
        on_spotify = gets.chomp == 'true'
    end

    if item_type == 'game'
        puts 'Enter the multiplayer status'
        multiplayer = gets.chomp == 'true'

        puts 'Enter the last played date'
        last_played_at = gets.chomp
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