require_relative './item'

class Book < Item
    attr_accessor :publisher, :cover_state

    def initialize(publisher, cover_state, label, publish_date)
        super(nil, nil, nil, label, publish_date)
        @publisher = publisher
        @cover_state = cover_state
        @archived = can_be_archived?
    end
    
    def can_be_archived?
        state = @cover_state.to_s
        return true if super() || state.casecmp?('bad') || state.casecmp?('very bad')

        false
    end

    private :can_be_archived?

end
