require_relative '../../helper'

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
