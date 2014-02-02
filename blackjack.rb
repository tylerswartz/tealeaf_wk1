
def calculate_total(cards) #cards passed as [['3','H'],['5','S']]

end


puts 
puts "=> Weclome to blackjack lite with only one deck. <="
puts "=> To play, use 'H' to Hit & 'S' to stay. No splitting. <="
puts 

suits = ['H','D','S','C']
cards = ['2','3','4','5','6','7','8','9','10','J','Q','K','A']
deck = cards.product(suits)

deck.shuffle!

hand = []
dealerhand = []

hand << deck.pop
dealerhand << deck.pop
hand << deck.pop
dealerhand << deck.pop

dealertotal = calculate_total(dealerhand) #this is a method, every action need to recalculate. Method defined at top.
handtotal = calculate_total(hand)

puts "Dealer is showing a: #{dealerhand[1]}"
puts "Your hand is: #{hand[0]} and #{hand[1]} for a total of: #{handtotal}"
puts 
puts "What would you like to do? 'H' for Hit, 'S' for Stay"

hit_or_stay = gets.chomp




#def open_deal(deck,n)
#  hand = []
#  n.times do
#    hand << deck[rand(deck.length)]
#  end
#  puts "Your hand:"
#  puts hand
#end#

#def open_dealer(deck,n)
#  deal_hand = []
#  n.times do
#    deal_hand << deck[rand(deck.length)]
#  end
#  puts "Dealer's hand:"
#  puts deal_hand
#end

#if ready.upcase == 'Y'
#  open_deal(deck,2)
#  open_dealer(deck,2)
#  if hand == 21
#    "Winner! Winner! Chicken Dinner!"
#  elsif deal_hand == 21
#    "Dealer has blackjack! Thanks for playing."  
#  else
#    puts "What would you like to do? 'H' = Hit 'S' = Stay"
#    action = gets.chomp
#    if action.upcase == 'H'
#      take another card
#    elsif action.upcase == 'S'
#      stay, move to dealer
#    else
#      puts "Sorry didn't catch that. What would you like to do?"
#    end
   
    
#  end
#else
#  puts "Okay, another time then."
#end