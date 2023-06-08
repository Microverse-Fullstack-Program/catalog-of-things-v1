module ListLabels
  def list_all_labels(labels)
    puts
    if labels.empty?
      puts 'No label found!'
      return
    end

    puts 'Listing all labels:'
    puts '-' * 50
    @labels.each do |label|
      print ' ' * 5 if label == @labels.first
      print "'#{label.title}'"
      print ',  ' unless label == @labels.last
    end
    puts
    puts '-' * 50
    puts
  end
end
