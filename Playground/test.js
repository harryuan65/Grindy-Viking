var nums = [1, 4, 2, 3, 2, 5, 6];
function findDuplicate(nums) {
  var seen = {};

  for (let i = 0; i < nums.length; i++) {
    let num = nums[i];
    if (seen[num]) return num;

    seen[num] = true;
  }
}

function count(nums) {
  var counts = {};

  for (let i = 0; i < nums.length; i++) {
    let num = nums[i];
    counts[num] ||= 0;
    counts[num] += 1;
  }
  return counts;
}

console.log(count(nums));
