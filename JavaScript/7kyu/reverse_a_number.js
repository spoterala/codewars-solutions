// Given a number, write a function to output its reverse digits. (e.g. given 123 the answer is 321)

// Numbers should preserve their sign; i.e. a negative number should still be negative when reversed.

// Examples
//  123 ->  321
// -456 -> -654
// 1000 ->    1

function reverseNumber(n) {
    var isNegative = n < 0 ;
    var digits = Math.abs(n).toString().split('');
    var res = [];
    
    for(var i=0; i < digits.length; i++){
      res[digits.length-i-1] = digits[i];
    }
    
    return isNegative ? -parseInt(res.join('')) : parseInt(res.join(''));
}