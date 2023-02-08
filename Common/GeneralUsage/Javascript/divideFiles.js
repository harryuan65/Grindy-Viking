function divideFiles(fileSizes, chunkSize) {
  const result = [];
  fileSizes = fileSizes.sort((a, b) => b - a);
  while (fileSizes.length > 0) {
    const chunk = [];
    let chunkSizeLeft = chunkSize;
    for (let i = 0; i < fileSizes.length; i++) {
      if (fileSizes[i] <= chunkSizeLeft) {
        chunk.push(fileSizes[i]);
        chunkSizeLeft -= fileSizes[i];
        fileSizes.splice(i, 1);
        i--;
      }
      if (chunkSizeLeft === 0) {
        break;
      }
    }
    result.push(chunk);
  }
  return result;
}

console.log(divideFiles([9, 8, 5, 1, 8, 3, 10, 6, 7, 1], 10))
// console.log(divideFiles([0.01953125,0.00390625,1.6,0.7998046875,0.0361328125,0.3076171875,2.6,0.0078125,0.404296875,3.8], 10))

// I have a list of files that will be uploaded to the server. However, the maximum upload size per API call is 10MB. I want the upload API to be called as less as possible.
// input: maximum size per upload = 10 MB, fileSizes(MB)=[1, 1, 3, 5, 6, 7, 8, 8, 9, 10]. Note that each element in this array represents a unique file.
// output: [[10],[1,9],[1,8],[8],[3,7],[5], [6]]. Note that all the files will be uploaded only once.
// can you write a code the generate the desired output?