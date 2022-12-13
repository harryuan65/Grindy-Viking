/**
 * @param {string} s
 * @return {string}
 */
var frequencySort = function (s) {
  let swap = function (arr, i, j) {
    let temp = arr[j];
    arr[j] = arr[i];
    arr[i] = temp;
  }
  let heapSort = function (freq) {
    let l = freq.length
    for (let i = Math.floor(l / 2) - 1; i >= 0; i--) {
      heapify(freq, l, i)
    }

    for (let i = l - 1; i >= 0; i--) {
      swap(freq, i, 0)
      heapify(freq, i, 0)
    }
  }
  let heapify = function (freq, n, i) {
    let largest = i, left = 2 * i + 1, right = 2 * i + 2;
    if (left < n && freq[left][1] > freq[largest][1]) {
      largest = left;
    }
    if (right < n && freq[right][1] > freq[largest][1]) {
      largest = right;
    }
    if (largest !== i) {
      swap(freq, i, largest);
      heapify(freq, n, largest);
    }
  }

  let l = s.length, freqDict = {}, freq = [];
  for (let i = 0; i < l; i++) {
    freqDict[s[i]] ||= 0;
    freqDict[s[i]] += 1
  }
  for (let key in freqDict) {
    freq.push([key, freqDict[key]])
  }
  heapSort(freq);
  console.log(freq)
  let answer = ""
  // this double loop will run total n times at max
  for (let i = freq.length - 1; i >= 0; i--) {
    let [char, charCount] = freq[i]
    for (let j = charCount; j > 0; j--) {
      answer += char;
    }
  }
  return answer;
};

export default frequencySort;