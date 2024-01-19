// Given a sequence of one or more consecutive natural numbers concatenated into a string, return the smallest possible first number in the sequence.
// Numbers will never be truncated.

// Examples
// "123" -> [1, 2, 3] -> 1
// "91011" -> [9, 10, 11] -> 9
// "17181920" -> [17, 18, 19, 20] -> 17
// "9899100" -> [98, 99, 100] -> 98
// "121122123" -> [121, 122, 123] -> 121
// "1235" -> [1235] -> 1235
// "101" -> [101] -> 101
// Size limits
// 0 < length string < 140
// 0 < smallest number < 1 000 000 000


function beginning(xs) {
    var splited = xs.split('');
    
    for(var i = 1; i<= splited.length; i++){
      var firstNumber = parseInt(splited.slice(0, i).join(''));
      var numberOfNumbers = splited.length / i;
      
      var numbers = ''
      for(var j = 0; j < numberOfNumbers; j++ ){
        numbers += (firstNumber + j).toString();
        if (numbers.length >= xs.length){
          break; 
            
        }
      }
      if ( xs == numbers){
        return firstNumber;   
      }
    }
}