// Leonardo numbers
// The Leonardo numbers are a sequence of numbers defined by:

// L(0) = 1 || 0
// L(1) = 1 || 0
// L(x) = L(x - 1) + L(x - 2) + 1
// Generalizing the above a bit more:

// L(x) = L(x - 1) + L(x - 2) + a
// Assume a to be the add number.

L = (n , L0 , L1 , add) => {
    var res = [];
    
    res[0] = L0;
    res[1] = L1;
    
    for(let i = 2; i < n; i++){
      res[i] = res[i-1] + res[i-2] + add;
    }
    
    return res;
}