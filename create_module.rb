require_relative 'music_album'
require_relative 'game'
require_relative 'book'
require_relative 'genre'
require_relative 'author'
require_relative 'label'

module Create
  def create_music_album
    display_header('Music Album')
    print 'Album Title: '
    name = gets.chomp
    print 'On spotify [Y/N]: '
    on_spotify = gets.chomp.upcase == 'Y'
    print 'Date of Release [yyyy-mm-dd]: '
    publish_date = gets.chomp
    new_album = MusicAlbum.new(on_spotify, name, publish_date)
    print 'Genre Name: '
    name = gets.chomp
    new_genre = Genre.new(name)
    new_album.genre = new_genre
    @music_albums << new_album unless @music_albums.include?(new_album)
    @genres << new_genre unless @genres.include?(new_genre)
    store_data
  end

  def create_game
    display_header('Game')
    print 'Game Title: '
    name = gets.chomp
    print 'Multiplayer: '
    multiplayer = gets.chomp
    print 'Date last played [yyyy-mm-dd]: '
    last_played_at = gets.chomp
    print 'Date of Release [yyyy-mm-dd]: '
    publish_date = gets.chomp
    new_game = Game.new(name, multiplayer, last_played_at, publish_date)
    print 'Label Title: '
    title = gets.chomp.capitalize
    print 'Label Color: '
    color = gets.chomp.capitalize
    new_label = Label.new(title, color)
    new_game.label = new_label
    @games << new_game unless @games.include?(new_game)
    @labels << new_label unless @labels.include?(new_label)
    store_data
  end

  def create_book
    display_header('Book')
    print 'Book Title: '
    name = gets.chomp
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover State: '
    cover_state = gets.chomp
    print 'Date of Publish [yyyy-mm-dd]: '
    publish_date = gets.chomp
    new_book = Book.new(name, publisher, cover_state, publish_date)
    print 'Author Firstname: '
    f_name = gets.chomp.capitalize
    print 'Author Lastname: '
    l_name = gets.chomp.capitalize
    new_author = Author.new(f_name, l_name)
    new_book.author = new_author
    @books << new_book unless @books.include?(new_book)
    @authors << new_author unless @authors.include?(new_author)
    store_data
  end

  def display_header(title)
    puts '----------------------------------------------'
    puts "            Enter #{title} Details"
    puts '----------------------------------------------'
  end
end

# module VerifyAssociates
#   def verify_author(f_param, s_param)
#     new_author = nil
#     if @authors.length.positive?
#       @authors.each do |ath|
#         new_author = f_param == ath.first_name && s_param == ath.last_name ? genre : Author.new(f_param, s_param)
#       end
#     else
#       new_author = Author.new(s_param, s_param)
#     end
#     new_author
#   end
#
#   def verify_label(title, color)
#     new_label = nil
#     if @labels.length.positive?
#       @labels.each do |label|
#         new_label = title == label.title && color == label.color ? label : Label.new(title, color)
#       end
#     else
#       new_label = Label.new(title, color)
#     end
#     new_label
#   end
#
#   def verify_genre(name)
#     new_genre = nil
#     if @genres.length.positive?
#       @genres.each do |genre|
#         new_genre = name == genre.name ? genre : Genre.new(name)
#       end
#     else
#       new_genre = Genre.new(name)
#     end
#     new_genre
#   end
# end
