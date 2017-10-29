require 'high_card'

describe 'hand_rankings' do
    matcher :beat do |losing|
        match do |winning|
            HighCard.beats?(hand(winning), hand(losing))
        end
    end
    def hand(strings)
        strings.map{|x| Card.from_string(x)}
    end
    example 'hand with highest card wins' do
        expect(%w(7H)).to beat(%W(6D))
        expect(%w(7H)).to_not beat(%w(8D))
        expect(%w(7H QD)).to beat(%w(6D JC))
        expect(%w(7H JC)).to_not beat(%w(6D QS))
    end
end