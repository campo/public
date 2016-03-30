import unittest
from math import floor

def merge_sort(unsorted):
    if len(unsorted) <= 1:
        return unsorted
    left = []
    right = []
    split_index = int(floor(len(unsorted) / 2.0))
    left = unsorted[:split_index]
    # print "left:", left
    right = unsorted[split_index:]
    # print "right:", right
    left = merge_sort(left)
    right = merge_sort(right)
    return merge(left, right)


def merge(left, right):
    result = []
    while len(left) > 0 or len(right) > 0:
        if len(left) > 0 and len(right) > 0:
            if left[0] <= right[0]:
                result.append(left[0])
                left = left[1:]
            else:
                result.append(right[0])
                right = right[1:]
        elif len(left) > 0:
            result.append(left[0])
            left = left[1:]
        elif len(right) > 0:
            result.append(right[0])
            right = right[1:]
    return result

# Testing
class TestMergeSort(unittest.TestCase):
    def test_merge_sort(self):
        self.assertEqual(merge_sort([4,6,2,6,2,1,87,1,7,2,6,2]), [1, 1, 2, 2, 2, 2, 4, 6, 6, 6, 7, 87])
        self.assertEqual(merge_sort([4,3,2,6,8,8,4,3,7,2,6,2]), [2, 2, 2, 3, 3, 4, 4, 6, 6, 7, 8, 8])
        self.assertEqual(merge_sort([3,2,1,4]), [1,2,3,4])
        self.assertEqual(merge_sort([3,2,3,3,1,3,3,4,3,3]), [1,2,3,3,3,3,3,3,3,4])
        self.assertEqual(merge_sort([-1,0,1,2]), [-1,0,1,2])
        self.assertEqual(merge_sort([2,0,1,-1]), [-1,0,1,2])
        self.assertEqual(merge_sort([2,1,0,-1]), [-1,0,1,2])
        self.assertEqual(merge_sort([1,2,1,2,-1,-1]), [-1,-1,1,1,2,2])

    def test_merge(self):
        self.assertEqual(merge([1,4,5], [2,3,6]), [1, 2, 3, 4, 5, 6])

if __name__ == '__main__':
    unittest.main()
