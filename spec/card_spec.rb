require 'card.rb'

RSpec.describe 'a playing card' do
   it 'has a suit' do
      raise unless Card.new(suit: :spades, rank: 4).suit == :spades
   end

   it 'has a rank' do
     raise unless Card.new(suit: :spades, rank: 4).rank == 4
   end

   describe 'a Jack' do
      it 'ranks higher than a 10' do
         a_jack = Card.new(suit: :spades, rank: :jack)
         a_ten = Card.new(suit: :spades, rank: 10)
         raise unless a_jack.rank > a_ten.rank
      end
   end

end
