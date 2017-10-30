require 'card'

module HighCard
    def self.beats?(hand, opposing)
        if (hand.map(&:rank).sort.last == opposing.map(&:rank).sort.last)
            return hand.map(&:rank).sort[-2] > opposing.map(&:rank).sort[-2]
        else
            return hand.map(&:rank).sort.last > opposing.map(&:rank).sort.last
        end
    end
end