require_relative './item'
require_relative './get_inputs'
class Game < Item
  attr_accessor :multiplayer, :last_played_at
  attr_reader :id

  def initialize(multiplayer, last_played_at, dictionary)
    super(dictionary)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @archived = can_be_archived?
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
      multiplayer: @multiplayer,
      last_played_at: @last_played_at

    }
  end

  def to_s
    "Game: #{@id} - #{@label} - By #{@author} - #{@genre.name}"
  end

  def self.create_from_ui
    get_inputs('game')
  end

  private

  def can_be_archived?
    @archived = if super || Date.today - Date.parse(@last_played_at) > 365 * 2
                  true
                else
                  false
                end
  end
end
