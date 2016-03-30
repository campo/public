// Worst case performance: O(n^2)
// Best case performance: O(n)
// Average case performance: O(n^2)
//
//
function bubbleSort(array) {
  var swapped = true;
  var tempVar;

  while (swapped) {
    swapped = false;
    for (i = 0; i < array.length; i++) {
      if (array[i] > array[i + 1]) {
        tempVar = array[i];
        array[i] = array[i + 1];
        array[i + 1] = tempVar;
        swapped = true;
      }
    }
  }

  return array;
}

var testArr = [5, 4, 3, 2, 1];
// var testArr = [10, 1, 2, 4, 8, 8, 9, -3, -3, -3, 6, 1];
// var testArr = [];
// var testArr = [1];
// var testArr = [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1];

console.log("You are testing Bubble Sort.");
console.log("Unsorted array is: " + testArr);
console.log("Sorted array is: " + bubbleSort(testArr));
