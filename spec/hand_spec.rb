require 'high_card'

describe 'hand_rankings', :aggregate_failures do
    matcher :beat do |losing|
        match do |winning|
            HighCard.beats?(hand(winning), hand(losing))
        end

        failure_message do |winning|
          "expected <#{hand(winning).join(" ")}> to beat <#{hand(losing).join(" ")}>"
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

    example 'next highest card is used as tie-breaker' do
        expect(%w(7H JC)).to beat(%w(6D JS))
        expect(%w(7H JC)).to_not beat(%w(8D JS))
        expect(%w(10H JC 9D)).to beat(%w(10D JS 8C))
    end
end
