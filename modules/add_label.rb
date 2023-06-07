require_relative '../label'

module AddLabel
  def add_label(labels)
    puts
    puts 'Adding a new label:'
    print 'Please enter the label title: '
    title = gets.chomp
    print 'Please enter the label color: '
    color = gets.chomp

    label = Label.new(title, color)
    labels << label
  end
end
