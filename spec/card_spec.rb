require 'card.rb'

RSpec.describe 'a playing card' do
   it 'has a suit' do
      raise unless Card.new(suit: :spades, rank: 4).suit == :spades
   end
end
