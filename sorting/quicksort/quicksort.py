import unittest
from random import randint

def quicksort(unsorted_list):
    # If the list is of length 1 or less,
    # return it because it's already sorted
    if len(unsorted_list) <= 1:
        return unsorted_list

    # Otherwise find a pivot value in the list
    # Here the pivot is selected randomly
    pivot_index = randint(0,len(unsorted_list) - 1)
    pivot = unsorted_list[pivot_index]

    # Delete the value being used as the pivot from
    # the unsorted list. It will be concatenated with
    # the sorted portions later
    del unsorted_list[pivot_index]

    # create empty lists representing the portions of the
    # unsorted list less than/equal or greater than the
    # pivot value
    less = []
    greater = []

    # for each element in the unsorted list, compare it to
    # the pivot value, and append it to the appropriate list
    for val in unsorted_list:
        if val <= pivot:
            less.append(val)
        else:
            greater.append(val)

    # the sorted list is the result of concatenating the
    # sorted less list with the pivot value, and the sorted
    # greater list
    return quicksort(less) + [pivot] + quicksort(greater)

# Testing
class TestQuicksort(unittest.TestCase):
    def test_quicksort(self):
        self.assertEqual(quicksort([4,3,2,6,8,8,4,3,7,2,6,2]), [2, 2, 2, 3, 3, 4, 4, 6, 6, 7, 8, 8])
        self.assertEqual(quicksort([3,2,1,4]), [1,2,3,4])
        self.assertEqual(quicksort([3,2,3,3,1,3,3,4,3,3]), [1,2,3,3,3,3,3,3,3,4])
        self.assertEqual(quicksort([-1,0,1,2]), [-1,0,1,2])
        self.assertEqual(quicksort([2,0,1,-1]), [-1,0,1,2])
        self.assertEqual(quicksort([2,1,0,-1]), [-1,0,1,2])
        self.assertEqual(quicksort([1,2,1,2,-1,-1]), [-1,-1,1,1,2,2])

if __name__ == '__main__':
    unittest.main()


