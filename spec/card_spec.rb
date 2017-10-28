require 'card.rb'

describe Card do
   def card(params = {})
     defaults = {
       suit: :hearts,
       rank: 7
     }
     Card.build(*defaults.merge(params).values_at(:suit, :rank))
   end

   it 'has a suit' do
      raise unless card(suit: :spades).suit == :spades
   end

   it 'has a rank' do
     raise unless card(rank: 4).rank == 4
   end

   describe 'a Jack' do
      it 'ranks higher than a 10' do
         a_jack = card(rank: :jack)
         a_ten = card(rank: 10)
         raise unless a_jack.rank > a_ten.rank
      end
   end

   describe 'a Queen' do
      it 'ranks higher than a Jack' do
         a_queen = card(rank: :queen)
         a_jack = card(rank: :jack)
         raise unless a_queen.rank > a_jack.rank
      end
   end

   describe 'a King' do
      it 'ranks higher than a Queen' do
         a_king = card(rank: :king)
         a_queen = card(rank: :queen)
         raise unless a_king.rank > a_queen.rank
      end
   end

end
