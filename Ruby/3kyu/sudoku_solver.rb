# Write a function that will solve a 9x9 Sudoku puzzle. The function will take one argument consisting of the 2D puzzle array, with the value 0 representing an unknown square.

# The Sudokus tested against your function will be "easy" (i.e. determinable; there will be no need to assume and test possibilities on unknowns) and can be solved with a brute-force approach.

# For Sudoku rules, see the Wikipedia article.

# var puzzle = [
#             [5,3,0,0,7,0,0,0,0],
#             [6,0,0,1,9,5,0,0,0],
#             [0,9,8,0,0,0,0,6,0],
#             [8,0,0,0,6,0,0,0,3],
#             [4,0,0,8,0,3,0,0,1],
#             [7,0,0,0,2,0,0,0,6],
#             [0,6,0,0,0,0,2,8,0],
#             [0,0,0,4,1,9,0,0,5],
#             [0,0,0,0,8,0,0,7,9]];

# sudoku(puzzle);
# /* Should return
# [[5,3,4,6,7,8,9,1,2],
# [6,7,2,1,9,5,3,4,8],
# [1,9,8,3,4,2,5,6,7],
# [8,5,9,7,6,1,4,2,3],
# [4,2,6,8,5,3,7,9,1],
# [7,1,3,9,2,4,8,5,6],
# [9,6,1,5,3,7,2,8,4],
# [2,8,7,4,1,9,6,3,5],
# [3,4,5,2,8,6,1,7,9]] 

def sudoku(puzzle)
    len = puzzle.length
    
    while true
      puzzle.each_with_index do |line, i|
        line.each_with_index do |elem, j| 
          if elem == 0
            possible = []
            (1..len).to_a.each do |num|
              puzzle[i][j] = num
              if valid?(puzzle)
                possible.push(num) 
              end
            end
            if possible.length == 1
              puzzle[i][j] = possible[0]
            else
              puzzle[i][j] = 0
            end
          end  
        end
      end
  
      if puzzle.flatten.select{|a| a == 0}.length == 0
        return puzzle
      end
    end
end
  
def valid?(data)
  data.each do |line|
    unless correct_line(line)
      return false
    end 
  end
  
  data.transpose.each do |line|
    unless correct_line(line)
      return false
    end
  end
  
  data.map{|line| line.each_slice(Math.sqrt(data.length)).to_a }.transpose.map{|line| line.each_slice(Math.sqrt(data.length)).to_a }.flatten(1).each do |mini_board|
    unless correct_line(mini_board.flatten)
      return false
    end
  end
  true
end
    
def correct_line(line)
  a = line.reject{|e| e == 0}
  return a.uniq.length == a.length
end