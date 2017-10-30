require 'card'

module HighCard
    def self.beats?(hand, opposing)
      winning = [hand, opposing]
         .sort_by {|h| h.map(&:rank).sort.reverse}
         .last
      hand == winning
    end
end
