require_relative 'item'

class Book < Item
    attr_accessor :publisher, :cover_state

    def initialize(publisher, cover_state, label, publish_date, archived)
        super(label, publish_date, archived)
        @publisher = publisher
        @cover_sate = cover_sate
    end

end
