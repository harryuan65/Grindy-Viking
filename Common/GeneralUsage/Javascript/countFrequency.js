/**
 *
 * @param {number[]} nums
 * @returns {object} frequence mapping, e.g. {1: 3, 2: 5}
 */
function countFrequency(nums) {
  var counts = {};

  for (let i = 0; i < nums.length; i++) {
    let num = nums[i];
    counts[num] ||= 0;
    counts[num] += 1;
  }
  return counts;
}

export default countFrequency;