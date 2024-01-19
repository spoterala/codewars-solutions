# Your job is to write a function which increments a string, to create a new string.

# If the string already ends with a number, the number should be incremented by 1.
# If the string does not end with a number. the number 1 should be appended to the new string.
# Examples:

# foo -> foo1

# foobar23 -> foobar24

# foo0042 -> foo0043

# foo9 -> foo10

# foo099 -> foo100

# Attention: If the number has leading zeros the amount of digits should be considered.

def increment_string(input)
    if input.empty? 
      return '1'
    end
    res = ''
    input = input + '0' unless input.match /([\d]+)\z/
    matched = input.match /([a-z0-9]+[a-z])*(0+)?([\d]+)/
    
    res = matched[1].to_s
    if matched[2].to_s.length > 0
      res += (matched[2].to_s + (matched[3].to_i + 1).to_s).split('').last(matched[2].to_s.length + matched[3].to_s.length).join
    else
      res += matched[2].to_s + (matched[3].to_i + 1).to_s
    end
    res
end