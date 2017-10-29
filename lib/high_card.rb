require 'card'

module HighCard
    def self.beats?(hand, opposing)
        hand.map(&:rank).sort.last > opposing.map(&:rank).sort.last
    end
end