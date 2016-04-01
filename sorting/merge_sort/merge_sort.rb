require 'minitest/autorun'

# Runtime
# Average: O(n * log(n))
# Best:    O(n * log(n))
# Worst:   O(n * log(n))
#
# Space:   O(n)
def merge_sort(array)
  return array if array.size < 2

  split_index = (array.size / 2.0).floor
  left = array[0...split_index]
  right = array[split_index...array.size]

  merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
  return right if left.empty?
  return left if right.empty?

  if left[0] <= right[0]
    [ left[0] ] + merge(left[1...left.size], right)
  else
    [ right[0] ] + merge(left, right[1...right.size])
  end
end

class Testing < Minitest::Test
  def test_merge
    assert_equal [1,2,3,4,5,6], merge([1,4,6], [2,3,5])
  end

  def test_merge_sort
    assert_equal [-2,-1,0,1,2], merge_sort([2,1,0,-1,-2])
  end
end
