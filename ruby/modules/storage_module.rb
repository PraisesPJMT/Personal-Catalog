require_relative '../../helper'

module Storage
  def store_genres
    genre_catalogue = []
    @genres.each do |genre|
      genre_items = []
      genre.items.each { |item| genre_items.push(item.publish_date) }
      genre_catalogue.push({ 'name' => genre.name, 'items' => genre_items })
    end
    File.write('storage/genres.json', JSON.generate(genre_catalogue))
  end

  def store_authors
    author_catalogue = []
    @authors.each do |author|
      author_items = []
      author.items.each { |item| author_items.push(item.publish_date) }
      author_catalogue.push({ 'first_name' => author.first_name,
                              'last_name' => author.last_name,
                              'items' => author_items })
    end
    File.write('storage/authors.json', JSON.generate(author_catalogue))
  end

  def store_labels
    label_catalogue = []
    @labels.each do |label|
      label_items = []
      label.items.each { |item| label_items.push(item.publish_date) }
      label_catalogue.push({ 'title' => label.title, 'color' => label.color, 'items' => label_items })
    end
    File.write('storage/labels.json', JSON.generate(label_catalogue))
  end

  def store_music_albums
    music_albums_catalogue = []
    @music_albums.each do |album|
      music_albums_catalogue.push({ 'id' => album.id,
                                    'name' => album.name,
                                    'publish_date' => album.publish_date,
                                    'on_spotify' => album.on_spotify })
    end
    File.write('storage/music_albums.json', JSON.generate(music_albums_catalogue))
  end

  def store_books
    book_catalogue = []
    @books.each do |book|
      book_catalogue.push({ 'id' => book.id,
                            'name' => book.name,
                            'publish_date' => book.publish_date,
                            'publisher' => book.publisher,
                            'cover_state' => book.cover_state })
    end
    File.write('storage/books.json', JSON.generate(book_catalogue))
  end

  def store_games
    game_catalogue = []
    @games.each do |game|
      game_catalogue.push({ 'id' => game.id,
                            'name' => game.name,
                            'publish_date' => game.publish_date,
                            'multiplayer' => game.multiplayer,
                            'last_played_at' => game.last_played_at })
    end
    File.write('storage/games.json', JSON.generate(game_catalogue))
  end

  def store_data
    FileUtils.mkdir_p('storage')
    store_genres unless @genres.empty?
    store_authors unless @authors.empty?
    store_labels unless @labels.empty?
    store_games unless @games.empty?
    store_books unless @books.empty?
    store_music_albums unless @music_albums.empty?
  end
end
