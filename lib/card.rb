class Card
    attr_reader :suit
    attr_reader :rank
    def initialize(suit:, rank:)
        @suit = suit
        @rank = rank
    end
end
