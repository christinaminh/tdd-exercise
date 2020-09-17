# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)

  face_cards = ['Jack', 'Queen', 'King']
  ace_count = 0
  score = 0

  if hand.length < 2 || hand.length > 5
    raise ArgumentError, "Invalid number of cards (#{hand.length}). Hand must contain 2-5 cards."
  end

  hand.each_with_index do |card, i|
    if !VALID_CARDS.include?(card)
      raise ArgumentError, "#{card} is not a valid card."
    end
    if face_cards.include?(card)
      hand[i] = 10
    elsif card == 'Ace'
      ace_count += 1
      hand[i] = 0
    end
  end

  score = hand.sum

  while ace_count > 0
    if score <= 10
      score += 11
      ace_count -= 1
    elsif score > 10
      score += 1
      ace_count -= 1
    end
  end

  if score > 21
    raise ArgumentError, "Bust. You lost with a hand of #{score} (#{score-21} over 21)."
  end

  return score
end
