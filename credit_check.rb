require 'pry'
class CreditCard
  attr_accessor :card_number, :valid, :card_array, :length, :sum

  def initialize
    @card_number = "4929735477250543"
    @valid = false
    @card_array = @card_number.scan(/./)
    @length = @card_array.length
    @sum = 0
  end

  def scan_card
    card_array.map! {|number| number.to_i}
    every_other
    add_all
    check_valid
  end

  def every_other
    card_array.each_with_index do |number, index|
      card_array[index] = double_combine(number) if (length - index).even?
    end
  end

  def double_combine(number)
    number *= 2
    number = (number % 10) + 1 if number >= 10
    number
  end

  def add_all
    sum = card_array.inject(:+)
  end

  def check_valid
    valid = true if sum % 10 == 0
    puts valid == true ? "The number is valid!" : "The number is invalid!"
  end
end

card = CreditCard.new
binding.pry

puts ""
