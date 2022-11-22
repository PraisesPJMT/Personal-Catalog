class Item
  attr_accessor :publish_date
  attr_reader :id, :archived

  def initialize(publish_date, id = Random.rand(1_000), archived: false)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def genre=(genre)
    @genre = genre
    genre.item << self unless genre.item.include?(genre)
  end

  def label=(label)
    @genre = label
    label.item << self unless label.item.include?(label)
  end

  def author=(author)
    @author = author
    author.item << self unless author.item.include?(author)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    Date.today.year - Date.parse(@publish_date).year > 10
  end
end
