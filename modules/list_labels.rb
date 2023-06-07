module ListLabels
  def list_all_labels(labels)
    puts
    if labels.empty?
      puts 'No label found!'
      return
    end

    puts 'Listing all labels:'
    @labels.each do |label|
      print "'#{label.title}'"
      print ', ' unless label == @labels.last
    end
    puts
  end
end
