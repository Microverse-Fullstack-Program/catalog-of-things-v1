require 'JSON'

module PreserveLabel
  def write_label(labels)
    file = File.open('./data/label.json', 'w+')

    label_hash = {}
    labels.each_with_index do |label, index|
      label_hash[(index + 1).to_s] = { 'id' => label.id, 'title' => label.title, 'color' => label.color }
    end
    file.write(JSON.pretty_generate(label_hash))
  end

  def read_label(labels)
    file = File.open('./data/label.json', 'r') if File.exist?('./data/label.json')
    return false if file.nil?

    return unless file.size.positive?

    labels_record = JSON.parse(file.read)
    labels_record.each do |_key, label|
      labels << Label.new(label['title'], label['color'])
    end
  end
end
