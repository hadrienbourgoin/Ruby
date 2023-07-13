def pick_bank_score(deck)
  # TODO: Use Random to get a new random score
  deck.sample
end

def pick_player_card(deck)
  # TODO: Use Random to get a new random card
  deck.sample
end

# Build a deck, cards are represented by their value
def deckbuilder
  deck = []
  4.times do
    i = 1
    loop do
      deck << i
      i += 1
      break if i == 10
    end
  end
  16.times { deck << 10 }
  deck.sort!
end
