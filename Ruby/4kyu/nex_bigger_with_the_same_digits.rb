# Create a function that takes a positive integer and returns the next bigger number that can be formed by rearranging its digits. For example:

#   12 ==> 21
#  513 ==> 531
# 2017 ==> 2071
# If the digits can't be rearranged to form a bigger number, return -1 (or nil in Swift, None in Rust):

#   9 ==> -1
# 111 ==> -1
# 531 ==> -1


def next_bigger(number)
    if number.digits.uniq.length == 1
      return -1
    end
    
    digits = number.to_s.split('')
    
    (2..digits.length).to_a.each do |n|
      res = (digits.first(digits.length - n).join + digits.last(n).sort.reverse.join).to_i
      if res > number
        digits.last(n).permutation(n).to_a.map{|a| a.join }.sort.each do |num|
          res = (digits.first(digits.length - n).join + num).to_i
          if res > number
            return res
          end
        end
      end
    end
    -1
end
  