# Implement the function unique_in_order which takes as argument a sequence and returns a list of items without any elements with the same value next to each other and preserving the original order of elements.

# For example:

# uniqueInOrder('AAAABBBCCDAABBB') == ['A', 'B', 'C', 'D', 'A', 'B']
# uniqueInOrder('ABBCcAD')         == ['A', 'B', 'C', 'c', 'A', 'D']
# uniqueInOrder([1,2,2,3,3])       == [1,2,3]

def unique_in_order(iterable)
    if iterable.is_a? Array
      iterable = iterable.join || ''
    end
    iterable.split('').each_with_index.map do |i, index|
      if index == 0 || iterable[index-1] != i
        if i.to_i.to_s == i
          i.to_i
        else
          i
        end
      end
    end.reject(&:nil?)
end