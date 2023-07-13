def colorful?(number)
  # TODO: return true if the number is colorful, false otherwise
  # Check if number is an integer
  if !/\A[-+]?\d+\z/.match(number)
    return false
  end

  # Turn the number into an integer array
  number = number.to_i.to_s
  mydigits = number.chars
  mydigits.each_index do |index|
    mydigits[index] = mydigits[index].to_i
  end
  # This array will store the digits and the results of the multiplications
  myresults = mydigits.dup
  # For each index in array, if index + 1 exists, calculate index * index + 1 and store it
  # inside an array
  if mydigits.count > 1
    myresults.push(mydigits.inject(:*)) # First of, we calculate the total
    if mydigits.count > 2
      mydigits.each_index do |index|
        if index < mydigits.count - 1 # For each digit except the last one
          myresults.push(mydigits[index] * mydigits[index + 1])
        end
      end
    end
  end
  puts "results: #{myresults}"
  if myresults.uniq!.nil? # Check is there are duplicate inside results
    return true
  else
    return false
  end
end

# puts "Enter a number:"
# mynumber = gets.chomp
# We control the user input here
# until /\A[-+]?\d+\z/.match(mynumber)
#   puts "Enter a number:"
#   mynumber = gets.chomp
# end
# Final answer, is it colourful?
# puts colorful?(mynumber)
