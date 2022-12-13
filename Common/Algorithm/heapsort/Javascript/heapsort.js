let swap = function (arr, i, j) {
  let temp = arr[j];
  arr[j] = arr[i];
  arr[i] = temp;
}
let heapSort = function (arr) {
  let l = arr.length
  for (let i = Math.floor(l / 2) - 1; i >= 0; i--) {
    heapify(arr, l, i)
  }
  console.log(`Current: ${arr.join(",")}`)
  console.log("---------------------------------")
  for (let i = l - 1; i >= 0; i--) {
    swap(arr, i, 0)
    heapify(arr, i, 0)
  }
  return arr;
}
let heapify = function (arr, n, i) {
  let largest = i, left = 2 * i + 1, right = 2 * i + 2;
  if (left < n && arr[left] > arr[largest]) {
    largest = left;
  }
  if (right < n && arr[right] > arr[largest]) {
    largest = right;
  }

  if (largest !== i) {
    swap(arr, i, largest);
    heapify(arr, n, largest);
  }
}

export default heapSort;