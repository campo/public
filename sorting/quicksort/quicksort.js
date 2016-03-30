// Average case performance: O(n * log(n))
// Best case performance:    O(n * log(n))
// Worst case performance:   O(n^2)
//
function quicksort(arr) {
  if (arr.length <= 1) {
    return arr;
  } else {
    var pivotIndex = Math.floor(arr.length / 2);
    var pivot = arr[pivotIndex];
    var lesser = [];
    var greater = [];
    var lesserIndex = 0;
    var greaterIndex = 0;

    for (i = 0; i < arr.length; i++) {
      if (i === pivotIndex) {
        continue;
      } else {
        if (arr[i] < pivot) {
          lesser[lesserIndex] = arr[i];
          lesserIndex++;
        } else {
          greater[greaterIndex] = arr[i];
          greaterIndex++;
        }
      }
    }

    return quicksort(lesser).concat(pivot).concat(quicksort(greater));
  }
}

console.log("You are testing Quick Sort.");
console.log("Expected: [ 1, 2, 3, 4, 5 ]", quicksort([5, 4, 3, 2, 1]));
console.log("Expected: [ -3, -3, -3, 1, 1, 2, 4, 6, 8, 8, 9, 10 ]", quicksort([10, 1, 2, 4, 8, 8, 9, -3, -3, -3, 6, 1]));
console.log("Expected: [ 1 ]",  quicksort([1]));
console.log("Expected: [ 1, 2 ,2 ]",  quicksort([2, 2, 1]));
