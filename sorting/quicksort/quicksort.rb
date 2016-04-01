require 'minitest/autorun'

# Runtime
# Best:    O(n * log(n))
# Average: O(n * log(n))
# Worst:   O(n^2)
# Worst case is pivot value being
# greatest or least value in the array
#
def quicksort(array)
  return array if array.size < 2

  pivot_value = array.sample
  lesser_array = []
  greater_array = []

  # The trick with quicksort is dealing with
  # duplicate instances of our pivot value
  #
  # Keep track of any values that match our pivot
  pivot_duplicates_array = []

  array.each do |value|
    if value == pivot_value
      pivot_duplicates_array << value
    elsif value < pivot_value
      lesser_array << value
    else
      greater_array << value
    end
  end

  quicksort(lesser_array) + pivot_duplicates_array + quicksort(greater_array)
end

class Testing < Minitest::Test
  def test_quicksort
    assert_equal [], quicksort([])
    assert_equal [1], quicksort([1])
    assert_equal [-2,-1,0,1,2], quicksort([2,1,0,-1,-2])
    assert_equal [-2,-2,-1,-1,0,0,1,1,2,2], quicksort([2,2,1,1,0,0,-1,-1,-2,-2])
  end
end
