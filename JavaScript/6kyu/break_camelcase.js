
// Complete the solution so that the function will break up camel casing, using a space between words.

// Example
// "camelCasing"  =>  "camel Casing"
// "identifier"   =>  "identifier"
// ""             =>  ""

function solution(string) {
    var pattern = /[A-Z]+/g;
    var match = string.match(pattern);
    if (!match)  {
      return string
    }
    
    var res = '';
    var splited = string.split('');
  
    for (var i = 0; i < splited.length; i++){
      if (splited[i].match(pattern)){
        res += ' '
      }
      res += splited[i];
    }
    
    return res;
}