require 'json'
def get_genre(genre_name)
  # Load the existing genres from the file
  existing_genres = JSON.parse(File.read('genre-data.json'))

  # Check if the genre already exists
  existing_genre = existing_genres.detect { |g| g['name'] == genre_name }

  if existing_genre
    # Use the existing genre if it already exists
    Genre.new(existing_genre['name'], existing_genre['items'])
  else
    # Otherwise, create a new genre and add it to the file
    new_genre = Genre.new(genre_name, [], id: Time.now.to_i)
    existing_genres << { 'id' => new_genre.id, 'name' => new_genre.name, 'items' => new_genre.items }
    File.write('genre-data.json', JSON.pretty_generate(existing_genres))
    new_genre
  end
end
