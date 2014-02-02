def say(msg)
  puts "=> #{msg}"
end

say "What's the first number?"
num1 = gets.chomp
say "What's the second number?"
num2 = gets.chomp
say "Press: 1 to Add, 2 to Subtract, 3, to Multiply, 4 to Divide."
operator = gets.chomp

if operator == '1'
  result = num1.to_i + num2.to_i
elsif operator == '2'
  result = num1.to_i - num2.to_i
elsif operator == '3'
  result = num1.to_i * num2.to_i
elsif operator == '4'
  result = num1.to_f / num2.to_f   #to_f allows Floats aka Decimals
end

say "Result is #{result}"
