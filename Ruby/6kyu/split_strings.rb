# Complete the solution so that it splits the string into pairs of two characters. If the string contains an odd number of characters then it should replace the missing second character of the final pair with an underscore ('_').

# Examples:

# * 'abc' =>  ['ab', 'c_']
# * 'abcdef' => ['ab', 'cd', 'ef']


def solution(str)
    str.split('').each_with_index.map do |s, index| 
      if index % 2 == 0
        s + (str[index+1] || '_')
      end
    end.reject{|s| s.nil?}
end