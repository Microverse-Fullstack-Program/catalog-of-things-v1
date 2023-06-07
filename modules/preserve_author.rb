require 'JSON'

module Preserveauthor
  def write_author(authors)
    file = File.open('./data/author.json', 'w+')

    author_hash = {}
    authors.each_with_index do |author, index|
      author_hash[(index + 1).to_s] =
                                {
                                    'id' => author.id, 
                                    'first_name' => author.first_name,
                                    'last_name' => author.last_name,
                                }
    end
    file.write(JSON.pretty_generate(author_hash))
  end

  def read_author(authors)
    file = File.open('./data/author.json', 'r') if File.exist?('./data/author.json')
    return false if file.nil?

    return unless file.size.positive?

    author_record = JSON.parse(file.read)
    authors_record.each do |_key, author|
      authors << Author.new(author['title'], author['genre'], author['author'], author['last_played_at'])
    end
  end
