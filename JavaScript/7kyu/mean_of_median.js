// Your goal is to implement the method meanVsMedian which accepts an odd-length array of integers and returns one of the following:

// 'mean' - in case mean value is larger than median value
// 'median' - in case median value is larger than mean value
// 'same' - in case both mean and median share the same value
// Reminder: Median

// Array will always be valid (odd-length >= 3)

function meanVsMedian(numbers) {
    var mean = numbers.reduce((acc, val) => acc + val) / numbers.length;
    var sortedNumbers = numbers.sort((a, b) => a - b);
    var median = numbers.length % 2 == 0 ? (sortedNumbers[numbers.length / 2 - 1] + sortedNumbers[numbers.length / 2] / 2) : sortedNumbers[numbers.length / 2 - 0.5];
    
    if (mean == median ) {
      return 'same';
    } else {
      return mean > median ? 'mean' : 'median';
    }    
}