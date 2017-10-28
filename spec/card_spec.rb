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
   
   describe 'a Queen' do
      it 'ranks higher than a Jack' do
         a_queen = Card.new(suit: :spades, rank: :queen)
         a_jack = Card.new(suit: :spades, rank: :jack)
         raise unless a_queen.rank > a_jack.rank
      end
   end
   
   describe 'a King' do
      it 'ranks higher than a Queen' do
         a_king = Card.new(suit: :spades, rank: :king)
         a_queen = Card.new(suit: :spades, rank: :queen)
         raise unless a_king.rank > a_queen.rank
      end
   end

end
