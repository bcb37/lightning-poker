class Card
    attr_reader :suit
    attr_reader :rank

    def self.build(suit, rank)
        new(suit: suit, rank: rank)
    end
    private_class_method :new
    def initialize(suit:, rank:)
        @suit = suit
        @rank = case rank
          when :jack then 11
          when :queen then 12
          when :king then 13
          else rank
        end
    end

    def ==(other)
       rank == other.rank && suit == other.suit
    end

    def hash
      [rank, suit].hash
    end

    def eql?(other)
      self == other
    end

    def self.from_string(value)
      short_suit = value[-1]
      suit = {
        "H" => :hearts,
        "C" => :clubs,
        "D" => :diamonds,
        "S" => :spades
      }.fetch(short_suit)

      rank = {
        "A" => :ace,
        "K" => :king,
        "Q" => :queen,
        "J" => :jack
      }.fetch(value[0]) { value[0..-2].to_i}

      Card.build(suit, rank)
    end

end
