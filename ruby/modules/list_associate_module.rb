module ListAssociates
  def list_genres
    if @genres.empty?
      error_feedback('Genre')
    else
      puts '----------------------------------------------'
      puts '              LIST OF GENRES'
      puts '----------------------------------------------'
      @genres.each_with_index do |gen, index|
        puts "[#{index + 1}] #{gen.name}"
        puts '----------------------------------------------'
      end
    end
  end

  def list_authors
    if @authors.empty?
      error_feedback('Author')
    else
      puts '----------------------------------------------'
      puts '              LIST OF AUTHORS'
      puts '----------------------------------------------'
      @authors.each_with_index do |author, index|
        puts "[#{index + 1}] #{author.first_name} #{author.last_name}"
        puts '----------------------------------------------'
      end
    end
  end

  def list_labels
    if @labels.empty?
      error_feedback('Label')
    else
      puts '----------------------------------------------'
      puts '              LIST OF LABELS'
      puts '----------------------------------------------'
      @labels.each_with_index do |label, index|
        puts "[#{index + 1}] #{label.title} - color(#{label.color})"
        puts '----------------------------------------------'
      end
    end
  end
end
