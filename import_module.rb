require 'json'
require 'fileutils'
require_relative 'music_album'
require_relative 'game'
require_relative 'book'
require_relative 'genre'
require_relative 'author'
require_relative 'label'

module Imports
  def import_music_albums
    music_album_store = 'storage/music_albums.json'
    if File.exist?(music_album_store)
      music_album_catalog = []
      JSON.parse(File.read(music_album_store)).map do |item|
        new_album = MusicAlbum.new(item['on_spotify'], item['name'], item['publish_date'])
        music_album_catalog << new_album unless music_album_catalog.include?(new_album)
      end
      music_album_catalog
    else
      []
    end
  end

  def import_books
    book_store = 'storage/books.json'
    if File.exist?(book_store)
      book_catalog = []
      JSON.parse(File.read(book_store)).map do |item|
        new_book = Book.new(item['name'], item['publisher'], item['cover_state'], item['publish_date'])
        book_catalog << new_book unless book_catalog.include?(new_book)
      end
      book_catalog
    else
      []
    end
  end

  def import_games
    game_store = 'storage/games.json'
    if File.exist?(game_store)
      game_catalog = []
      JSON.parse(File.read(game_store)).map do |item|
        new_game = Game.new(item['name'], item['multiplayer'], item['last_played_at'], item['publish_date'])
        game_catalog << new_game unless game_catalog.include?(new_game)
      end
      game_catalog
    else
      []
    end
  end

  def import_genres
    genre_store = 'storage/genres.json'
    if File.exist?(genre_store)
      genres_catalog = []
      JSON.parse(File.read(genre_store)).map do |genre|
        new_genre = Genre.new(genre['name'])
        genre['items'].each do |publish_date|
          @music_albums.each do |album|
            album.genre = new_genre if album.publish_date == publish_date
          end
        end
        genres_catalog << new_genre unless genres_catalog.include?(new_genre)
      end
      genres_catalog
    else
      []
    end
  end

  def import_authors
    author_store = 'storage/authors.json'
    if File.exist?(author_store)
      author_catalog = []
      JSON.parse(File.read(author_store)).map do |author|
        new_author = Author.new(author['first_name'], author['last_name'])
        author['items'].each do |publish_date|
          @books.each do |book|
            book.author = new_author if book.publish_date == publish_date
          end
        end
        author_catalog << new_author unless author_catalog.include?(new_author)
      end
      author_catalog
    else
      []
    end
  end

  def import_labels
    label_store = 'storage/labels.json'
    if File.exist?(label_store)
      label_catalog = []
      JSON.parse(File.read(label_store)).map do |label|
        new_label = Label.new(label['title'], label['color'])
        label['items'].each do |publish_date|
          @games.each do |game|
            game.label = new_label if game.publish_date == publish_date
          end
        end
        label_catalog << new_label unless label_catalog.include?(new_label)
      end
      label_catalog
    else
      []
    end
  end
end
