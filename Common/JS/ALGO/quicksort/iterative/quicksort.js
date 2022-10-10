function quickSort(a, s, e) {
  let stack = [[s, e]];
  while(stack.length > 0) {
    let [start, end] = stack.pop();
    if (start < end) {
      let p = partition(a, start, end);
      stack.push([start, p-1]);
      stack.push([p+1, end]);
    }
  }
  return a;
}

function partition(a, start, end) {
  if (start === end) {
    return start;
  }
  let pivot = a[start], i = start+1, j = end;

  while(true){
    while(a[i] <= pivot && i < end) {
      i+=1
    }

    while(a[j] > pivot && j > 0) {
      j-=1
    }

    if(i < j) {
      swap(a, i, j)
    } else {
      swap(a, start, j)
      break;
    }
  }

  return j;
}

function swap(a, i, j) {
  let temp = a[i];
  a[i] = a[j];
  a[j] = temp;
}

export { quickSort }

// console.log(quickSort([6, 2, 1, 4, 8, 7, 3, 5], 0, [6, 2, 1, 4, 8, 7, 3, 5].length-1));