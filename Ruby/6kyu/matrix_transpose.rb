# Write a function that outputs the transpose of a matrix - a new matrix where the columns and rows of the original are swapped.

# For example, the transpose of:

# | 1 2 3 |
# | 4 5 6 |
# is

# | 1 4 |
# | 2 5 |
# | 3 6 |
# The input to your function will be an array of matrix rows. You can assume that each row has the same length, and that the height and width of the matrix are both positive.

def transpose(matrix)
    #your code here
    new_matrix = []
  
    matrix.each_with_index do |line, i|
      line.each_with_index do |elem, j|
        new_matrix.push [] if i == 0
        new_matrix[j].push elem 
        
      end
    end
    
    new_matrix
end