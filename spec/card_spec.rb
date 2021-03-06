require 'card.rb'
require 'set'

describe Card do
   def card(params = {})
     defaults = {
       suit: :hearts,
       rank: 7
     }
     Card.build(*defaults.merge(params).values_at(:suit, :rank))
   end

   it 'has a suit' do
      expect(card(suit: :spades).suit).to eq(:spades)
   end

   it 'has a rank' do
     expect(card(rank: 4).rank).to eq(4)
   end
   context 'equality' do
     subject { card(suit: :spades, rank: 7) }
     describe 'comparing against self' do
       let(:other) { card(suit: :spades, rank: 7) }
       it 'is equal' do
          expect(subject).to eq(other)
       end
       it 'is hash equal' do
          expect(Set.new([subject, other]).size).to eq(1)
       end
     end
     shared_examples_for 'an unequal card' do
       it 'is not equal' do
          expect(subject).not_to eq(other)
       end

       it 'is not hash equal' do
          expect(Set.new([subject, other]).size).to eq(2)
       end
     end
     describe 'comparing to a card of a different suit' do
         let(:other) {card(suit: :hearts, rank: 7)}
         it_behaves_like 'an unequal card'
     end

     describe 'comparing to a card of a different rank' do
       let(:other) {card(suit: :spades, rank: 6)}
       it_behaves_like 'an unequal card'
     end
   end
   describe 'a Jack' do
      it 'ranks higher than a 10' do
         a_jack = card(rank: :jack)
         a_ten = card(rank: 10)
         expect(a_jack.rank).to be > a_ten.rank
      end
   end

   describe 'a Queen' do
      it 'ranks higher than a Jack' do
         a_queen = card(rank: :queen)
         a_jack = card(rank: :jack)
         expect(a_queen.rank).to be > a_jack.rank
      end
   end

   describe 'a King' do
      it 'ranks higher than a Queen' do
         a_king = card(rank: :king)
         a_queen = card(rank: :queen)
         expect(a_king.rank).to be > a_queen.rank
      end
   end

   describe '.from_string', :aggregate_failures do
      def self.it_parses(string, as: as)
        it "parses #{string}" do
           expect(Card.from_string(string)).to eq (as)
        end
      end
      it_parses "7H", as: Card.build(:hearts, 7)
      it_parses "10S", as: Card.build(:spades, 10)
      it_parses "KS", as: Card.build(:spades, :king)
      it_parses "QD", as: Card.build(:diamonds, :queen)
      it_parses "JH", as: Card.build(:hearts, :jack)
      it_parses "AC", as: Card.build(:clubs, :ace)
   end

end
