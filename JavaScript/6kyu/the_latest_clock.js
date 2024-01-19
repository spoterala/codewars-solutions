// Write a function which receives 4 digits and returns the latest time of day that can be built with those digits.

// The time should be in HH:MM format.

// Examples:

// digits: 1, 9, 8, 3 => result: "19:38"
// digits: 9, 1, 2, 5 => result: "21:59" ("19:25" is also a valid time, but 21:59 is later)
// Notes
// Result should be a valid 24-hour time, between 00:00 and 23:59.
// Only inputs which have valid answers are tested.

function latestClock(a, b, c, d) {
    var array = [a, b, c, d].sort((a,b) => a-b);
    var greaterThenFive = array.filter((elem) => elem > 5);  
    
    if (greaterThenFive.length < 2 || array.indexOf(2) == -1 ) {
      var firstNumber = Math.max(...array.filter((elem) => elem < 3));
    } else {
      var firstNumber = Math.max(...array.filter((elem) => elem < 2));
    }
    
    array.splice(array.indexOf(firstNumber), 1);
  
    var secondNumber = firstNumber == 2 ? Math.max(...array.filter((elem) => elem < 4)) : Math.max(...array);
    array.splice(array.indexOf(secondNumber), 1);
  
    var max = Math.max(...array);
    var min = Math.min(...array);
  
    if (max > 5){
        return firstNumber.toString() + secondNumber.toString() + ':' + min.toString() + max.toString();
    } else {
        return firstNumber.toString() + secondNumber.toString() + ':' + max.toString() + min.toString();    
    }
}