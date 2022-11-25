module ListItems
  def list_music_albums
    if @music_albums.empty?
      error_feedback('Music Album')
    else
      puts '----------------------------------------------'
      puts '            LIST OF MUSIC ALBUMS'
      puts '----------------------------------------------'
      @music_albums.each_with_index do |album, index|
        music_genre = nil
        @genres.each do |gen|
          gen.items.each do |item|
            music_genre = gen if album.id == item.id
          end
        end
        puts "[#{index + 1}]   Album Title: #{album.name}
      Genre: #{music_genre.name}
      On Spotify: #{album.on_spotify ? 'Yes' : 'Not'}
      Release Date: #{album.publish_date}"
        puts '----------------------------------------------'
      end
    end
  end

  def list_games
    if @games.empty?
      error_feedback('Game')
    else
      puts '----------------------------------------------'
      puts '              LIST OF GAMES'
      puts '----------------------------------------------'
      @games.each_with_index do |game, index|
        game_label = nil
        @labels.each do |label|
          label.items.each { |item| game_label = label if game.id == item.id }
        end
        puts "[#{index + 1}]   Game Title: #{game.name}
      Multiplayer: #{game.multiplayer}
      Release Date: #{game.publish_date}
      Last Session: #{game.last_played_at}
      Label: #{game_label.title}(#{game_label.color})"
        puts '----------------------------------------------'
      end
    end
  end

  def list_books
    if @books.empty?
      error_feedback('Book')
    else
      puts '----------------------------------------------'
      puts '                 LIST OF BOOKS'
      puts '----------------------------------------------'
      @books.each_with_index do |book, index|
        book_author = nil
        @authors.each do |author|
          author.items.each { |item| book_author = author if book.id == item.id }
        end
        puts "[#{index + 1}]   Book Title: #{book.name}
      Cover State: #{book.cover_state}
      Publisher: #{book.publisher}
      Published Date: #{book.publish_date}
      Author: #{book_author.first_name} #{book_author.last_name}"
        puts '----------------------------------------------'
      end
    end
  end
end
