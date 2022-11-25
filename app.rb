require_relative 'create_module'
require_relative 'list_associate_module'
require_relative 'list_items_module'
require_relative 'storage_module'
require_relative 'import_module'

class Catalog
  include Create
  include ListAssociates
  include ListItems
  include Storage
  include Imports
  # include VerifyAssociates

  attr_reader :genre, :music_album

  def initialize
    @books = import_books
    @music_albums = import_music_albums
    @games = import_games
    @genres = import_genres
    @labels = import_labels
    @authors = import_authors
  end

  def display_menu
    puts '==================================================='
    puts '                  PERSONAL CATALOG'
    puts '==================================================='
    puts "Please choose an option by entering a number:
  [1] - List all books
  [2] - List all music albums
  [3] - List all games
  [4] - List all genres (e.g 'Comedy', 'Thriller')
  [5] - List all labels (e.g. 'Gift', 'New')
  [6] - List all authors (e.g. 'Stephen King')
  [7] - Add a book
  [8] - Add a music album
  [9] - Add a game
  [10]- Exit"
  end

  def list_command(response)
    case response
    when '1'
      list_books
    when '2'
      list_music_albums
    when '3'
      list_games
    when '4'
      list_genres
    when '5'
      list_labels
    when '6'
      list_authors
    end
  end

  def create_command(response)
    case response
    when '7'
      create_book
    when '8'
      create_music_album
    when '9'
      create_game
    end
  end

  def app_exit
    puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
    puts '    Thanks for using the Personal Catalog App'
    puts '<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<'
  end

  def invalid_entry
    puts '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
    puts '        The option entered is not valid!'
    puts '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
  end

  def error_feedback(type)
    puts '----------------------------------------------'
    puts "  Collection has no #{type} added yet"
    puts "  You can add a new #{type} from the main menu"
    puts '----------------------------------------------'
  end
end
