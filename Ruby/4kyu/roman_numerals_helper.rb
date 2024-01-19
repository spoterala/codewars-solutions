# Write two functions that convert a roman numeral to and from an integer value. Multiple roman numeral values will be tested for each function.

# Modern Roman numerals are written by expressing each digit separately starting with the left most digit and skipping any digit with a value of zero. In Roman numerals 1990 is rendered: 1000=M, 900=CM, 90=XC; resulting in MCMXC. 2008 is written as 2000=MM, 8=VIII; or MMVIII. 1666 uses each Roman symbol in descending order: MDCLXVI.

# Input range : 1 <= n < 4000

# In this kata 4 should be represented as IV, NOT as IIII (the "watchmaker's four").

# Examples
# to roman:
# 2000 -> "MM"
# 1666 -> "MDCLXVI"
# 1000 -> "M"
#  400 -> "CD"
#   90 -> "XC"
#   40 -> "XL"
#    1 -> "I"

# from roman:
# "MM"      -> 2000
# "MDCLXVI" -> 1666
# "M"       -> 1000
# "CD"      -> 400
# "XC"      -> 90
# "XL"      -> 40
# "I"       -> 1

class RomanNumerals
    @symbols = {1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD', 100 => 'C', 90 => 'XC', 50 => 'L', 40 => 'XL',  10 => 'X', 9 => 'IX', 5 => 'V', 4 => 'IV', 1 => 'I' }
    @new_symbols = @symbols.map{|k, v| [v, k] }.to_h 
    
    def self.from_roman(str)
      
      skip_next = false
      str.split('').each_with_index.map do |s, index|
        if skip_next
          skip_next = false
          0
        else
          if @new_symbols.has_key?(s + str[index + 1].to_s )
            skip_next = true
            @new_symbols[s + str[index + 1].to_s] 
          else
            @new_symbols[s] 
          end
        end
      end.reduce(&:+)
    end
  
    def self.to_roman(number)
      res = ''
      @symbols.each_with_index do |(key, value), index|
        div = (number / key).to_i
        if div > 0 
            res += value * div
        end
        number -= div * key
      end
      res
    end
end