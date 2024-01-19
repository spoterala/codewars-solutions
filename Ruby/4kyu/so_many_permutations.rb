# In this kata, your task is to create all permutations of a non-empty input string and remove duplicates, if present.

# Create as many "shufflings" as you can!

# Examples:

# With input 'a':
# Your function should return: ['a']

# With input 'ab':
# Your function should return ['ab', 'ba']

# With input 'abc':
# Your function should return ['abc','acb','bac','bca','cab','cba']

# With input 'aabb':
# Your function should return ['aabb', 'abab', 'abba', 'baab', 'baba', 'bbaa']
# Note: The order of the permutations doesn't matter.

# Good luck!

def permutations(string)
    #your code here
    chars_array = string.chars
    
    if chars_array.length == 1
      return chars_array
    elsif chars_array.length == 2
      return [chars_array.join(''), chars_array.reverse.join('')].uniq
    else
      res = []
      for char in chars_array
        removed = false
        perms = permutations(chars_array.reject{|c| 
          if  c == char && !removed
            removed = true
            true
          else
            false
          end
        }.join('') )
        
        for permutation in perms
          res.push(char + permutation) 
        end
      end
      return res.uniq
    end
end