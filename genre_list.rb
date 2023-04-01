require 'json'

def parse_genre
  genres = []
  # iterate through each JSON file
  Dir.glob('*.json') do |file|
    # load the JSON file
    data = JSON.parse(File.read(file))

    # iterate through each item in the JSON file
    data.each do |item|
      # extract the genre name and add it to the genres array
      genres << item['genre']['name']
    end
  end

  # create a set of unique genre names
  unique_genres = genres.uniq

  # save the set of unique genre names to a new JSON file
  File.write('genres.json', JSON.pretty_generate(unique_genres))
end
