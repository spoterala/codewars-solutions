// This time no story, no theory. The examples below show you how to write function accum:

// Examples:
// accum("abcd") -> "A-Bb-Ccc-Dddd"
// accum("RqaEzty") -> "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
// accum("cwAt") -> "C-Ww-Aaa-Tttt"
// The parameter of accum is a string which includes only letters from a..z and A..Z.

function accum(s) {
    var splited = s.split('');
    var res = [];
    for(let i = 0; i < splited.length; i++){
      let letter = splited[i];
      let repetition = [];
      for(let j = 0; j <= i; j++){
        repetition.push(j == 0 ? letter.toUpperCase() : letter.toLowerCase() );
      }
      res.push(repetition.join(''));
    }
    
    return res.join('-')
}