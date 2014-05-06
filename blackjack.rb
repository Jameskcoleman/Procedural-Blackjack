require "pry"

def handcount(hand)
handvalue = 0
aces_in_hand = 0
hand.each do |card|
  cardvalue = 0
  if card[1] == "2"
    cardvalue = 2
  elsif card[1] == "3"
    cardvalue = 3
  elsif card[1] == "4"
    cardvalue = 4
  elsif card[1] == "5"
    cardvalue = 5
  elsif card[1] == "6"
    cardvalue = 6
  elsif card[1] == "7"
    cardvalue = 7
  elsif card[1] == "8"
    cardvalue = 8
  elsif card[1] == "9"
    cardvalue = 9
  elsif card[1] == "10"
    cardvalue = 10
  elsif card[1] == "J"
    cardvalue = 10
  elsif card[1] == "Q"
    cardvalue = 10
  elsif card[1] == "K"
    cardvalue = 10
  elsif card[1] == "A"
    cardvalue = 11
    aces_in_hand = aces_in_hand + 1
  end
  handvalue = handvalue + cardvalue
end
while aces_in_hand > 0 do
  if handvalue > 21
    handvalue = handvalue - 10
  end
  aces_in_hand = aces_in_hand - 1
end
handvalue = handvalue + 0
end

#Begin

puts "Welcome to Blackjack!"
suits = ["H", "D", "S", "C"]
cards = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
deck = suits.product(cards)
deck.shuffle!
player_hand = []
dealer_hand = []
player_hand << deck.pop
dealer_hand << deck.pop
player_hand << deck.pop
dealer_hand << deck.pop
player_hand_value = handcount(player_hand)
dealer_hand_value = handcount(dealer_hand)
puts "The dealer is holding: #{dealer_hand}"
puts "The value of the dealer's cards is: "
puts dealer_hand_value
puts "You are holding: #{player_hand}"
puts "The value of your cards is: "
puts player_hand_value

# Player plays

player_proceed = true
player_hand_value = handcount(player_hand)
if player_hand_value == 21
  puts "You hit blackjack! You win!"
  exit
end
while player_proceed == true
  puts "Would you like to hit or stay?"
  decision = gets.chop
  if !["hit", "stay"].include?(decision)
    puts "You must enter 'hit' or 'stay'."
    next
  end
  if decision.downcase == "hit"
    player_proceed = true
    player_hand << deck.pop
    player_hand_value = handcount(player_hand)
    puts "You are holding: #{player_hand}"
    puts "The value of your cards is: "
    puts player_hand_value
    if player_hand_value > 21
      player_proceed = false
    end
  elsif decision.downcase == "stay"
    player_proceed = false
  end
end

# Dealer plays

dealer_hand_value = handcount(dealer_hand)
if dealer_hand_value == 21
  puts "The dealer hit blackjack. The dealer wins."
  exit
end
  while dealer_hand_value < 17
    dealer_hand << deck.pop
    dealer_hand_value = handcount(dealer_hand)
  end

# Report results

player_hand_value = handcount(player_hand)
dealer_hand_value = handcount(dealer_hand)
puts "The dealer's final hand is: #{dealer_hand}"
puts "The value of the dealer's cards is: "
puts dealer_hand_value
puts "The value of your cards is: "
puts player_hand_value
if player_hand_value > 21
  puts "You have gone bust. The dealer wins."
elsif dealer_hand_value > 21
    puts "The dealer has gone bust. You win! Congratulations!"
elsif player_hand_value > dealer_hand_value
    puts "You win! Congratulations!"
elsif player_hand_value < dealer_hand_value
    puts "The dealer wins."
elsif player_hand_value == dealer_hand_value
    puts "The game is a tie."
end

exit