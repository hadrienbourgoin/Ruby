require_relative 'black_jack'

def state_of_the_game(player_score, bank_score)
  # TODO: return (not print!) a message containing the player's score and bank's score
  "Your score is #{player_score}, bank is #{bank_score}"
end

def end_game_message(player_score, bank_score)
  # TODO: return (not print!) a message telling if the user won or lost.
  if player_score.to_i > 21
    return "Bust! You lose!"
  elsif player_score.to_i == 21
    return "Black Jack! You win!"
  elsif player_score.to_i > bank_score.to_i
    return "You beat the bank! You win!"
  elsif player_score.to_i < bank_score.to_i
    return "Bank beats you! You lose!"
  elsif player_score.to_i == bank_score.to_i
    return "Push! You get your money back!"
  end
end
