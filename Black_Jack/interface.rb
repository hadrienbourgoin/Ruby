require_relative "croupier"

# TODO: make the user play from terminal in a while loop that will stop
#       when the user will not be asking for  a new card
puts "Enter your initial cash:"
cash = gets.chomp.to_i
while cash < 10 # Set the cash
  puts "cash can't be less than 10:"
  cash = gets.chomp.to_i
end
bet = 0
while bet > cash || bet.zero? # Set the bet
  puts "Enter your initial bet:"
  bet = gets.chomp.to_i
  puts "Bet can't be more than cash and can't be 0" if bet > cash || bet.zero?
end
newgame = true
# The game is inside the while (player wants to play and have money to do so)
while cash.positive? && newgame
  deck = deckbuilder
  bankscore = pick_bank_score(deck)
  deck.delete_at(deck.index(bankscore))
  bankscore = 11 if bankscore == 1 # if 1 (Ace), becomes 11
  playerscore = pick_player_card(deck)
  deck.delete_at(deck.index(playerscore))
  playerscore = 11 if playerscore == 1 # if 1 (Ace), becomes 11
  puts state_of_the_game(playerscore, bankscore)
  answer = "y"
  while ["y", "yes"].include?(answer) && playerscore < 21 # While player wants to draw and hasn't bust
    puts "Card? \"y\" or \"yes\" to get a new card"
    answer = gets.chomp.downcase
    if ["y", "yes"].include?(answer)
      carddrew = pick_player_card(deck) # if 1, becomes 11 if best for player
      deck.delete_at(deck.index(carddrew))
      if carddrew == 1 && playerscore + 11 < 22
        carddrew = 11
      end
      playerscore += carddrew
      puts "You drew: #{carddrew}"
      # dealer then draw a card if is score < player score
      if bankscore < playerscore
        carddrew = pick_bank_score(deck) # if 1, becomes 11 if best for player
        deck.delete_at(deck.index(carddrew))
        if carddrew == 1 && bankscore + 11 < 22
          carddrew = 11
        end
        bankscore += carddrew
      end
      p deck # TODO: comment this as this is cheating
      puts state_of_the_game(playerscore, bankscore)
    end
  end
  message = end_game_message(playerscore, bankscore) # game result
  puts message
  # The game calculate and tells you about your gains/losses
  if ["Bust! You lose!", "Bank beats you! You lose!"].include?(message)
    puts "You lost your bet: #{bet}$"
    cash -= bet
  elsif message == "Black Jack! You win!"
    puts "You won three times your bet: #{bet * 3}$"
    cash += bet * 3
  elsif message == "You beat the bank! You win!"
    puts "You won your bet: #{bet}$"
    cash += bet
  elsif message == "Push! You get your money back!"
    puts "You get your bet: #{bet}$ back"
  end
  puts "cash: #{cash}$"
  # if you still have cash, you can play again
  if cash.positive?
    puts "Play again? \"y\" or \"n\""
    if !["y", "yes"].include?(gets.chomp.downcase)
      newgame = false
      puts "Thank you for playing, see you again"
    else
      puts "New game:"
      bet = 0
      while bet > cash || bet.zero? # Set the bet again
        puts "Enter your new bet:"
        bet = gets.chomp.to_i
        puts "Bet can't be more than cash and can't be 0" if bet > cash || bet.zero?
      end
    end
  else
    puts "You don't have any cash left, thank you for playing, see you again"
    newgame = false
  end
end
