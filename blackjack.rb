
def calculate_total(cards) 
  array = cards.map{|e| e[0]}
  total = 0
  
  array.each do |v|
    if v == 'Ace'
      total = total + 11
    elsif v.to_i == 0
      total = total + 10
    else
      total = total + v.to_i
    end
  end
  
  array.select{|e| e == "Ace"}.count.times do
    total = total - 10 if total > 21
  end
   
  return total  
end

# Start of game & initial deal

puts 
puts "=> Weclome to blackjack lite with only one deck. <="
puts "=> To play, use 'H' to Hit & 'S' to stay. No splitting. <="
puts 

suits = ['Hearts','Diamonds','Spades','Clubs']
cards = ['2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace']
deck = cards.product(suits)

deck.shuffle!

hand = []
dealerhand = []

hand << deck.pop
dealerhand << deck.pop
hand << deck.pop
dealerhand << deck.pop

dealertotal = calculate_total(dealerhand) 
handtotal = calculate_total(hand)

puts "Dealer is showing a: #{dealerhand[1]}"
puts "Your hand is: #{hand[0]} and #{hand[1]} for a total of: #{handtotal}"
puts 

if handtotal == 21
  puts "Winner, winner, chicken dinner!"
  exit
end

# player play

while handtotal < 21
  puts "What would you like to do? H for Hit, S for Stay"
  hit_or_stay = gets.chomp
    if hit_or_stay.upcase == "H"
      hand << deck.pop
      puts "New card is: #{hand.last}"
      handtotal = calculate_total(hand)
      puts "Your hand total is now: #{handtotal}"
      
      if handtotal == 21
        puts "Congrats, you hit 21!"
        exit
      elsif handtotal > 21
        puts "Sorry, you busted"
        puts "The dealer had: #{dealerhand[0]} and #{dealerhand[1]}"
        puts "For a total of: #{dealertotal}"
        exit
      end
      
    elsif hit_or_stay.upcase == "S"
      puts "You choose to stay with a hand of: #{handtotal}"
      break
    end    
end

if dealertotal == 21
  puts "Dealer hit blackjack. Better luck next time."
  exit
end

# dealer play

while dealertotal < 17
  puts "Dealer's hand: #{dealerhand[0]} #{dealerhand[1]}"
  dealerhand << deck.pop
  puts "Dealer hits & draws a: #{dealerhand.last}"
  dealertotal = calculate_total(dealerhand)
  if dealertotal > 21
    puts "Congrats, the dealer busted...with a total of #{dealertotal}"
    exit
  elsif dealertotal == 21
    puts "Sorry, but dealer got blackjack"
    exit
  end
end


# finalize game and announce winner

puts "Dealer's total: #{dealertotal}"
puts "Your hand total: #{handtotal}"


if handtotal > dealertotal
  puts "You win!! Great Job"
elsif dealertotal > handtotal
  puts "Sorry, but the dealer won..."
else dealertotal == handtotal
  puts "sorry, tie goes to the house...you lose"
end

