
card_number = "4929735477250543"

valid = false

card_array = card_number.scan(/./)
length = card_array.length

card_array.each_with_index do |number, id|
  number = number.to_i
  if (length - id).even?
      number *= 2
      number = (number % 10) + 1 if number >= 10
  end
  card_array[id] = number
end

sum = card_array.inject(:+)

valid = true if sum % 10 == 0

puts valid == true ? "The number is valid!" : "The number is invalid!"
