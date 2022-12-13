/**
 *
 * @param {number[]} nums
 * @returns {number} the number found or -1 if not found
 */
function findDuplicate(nums) {
  var seen = {};

  for (let i = 0; i < nums.length; i++) {
    let num = nums[i];
    if (seen[num]) return num;

    seen[num] = true;
  }
  return -1;
}

export default findDuplicate;