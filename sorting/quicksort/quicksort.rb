require 'minitest/autorun'

class Quicksort
  def self.sort(array)
    return array if array.size <= 1

    # select a random pivot value from the array
    pivot = array.sample
    lower_array = []
    higher_array = []

    # The trick with quicksort is dealing with
    # duplicate instances of our pivot value
    #
    # Keep track of any values that match our pivot
    pivot_duplicates = []

    array.each do |value|
      if value == pivot
        pivot_duplicates << value
        next
      end

      if value < pivot
        lower_array << value
      else
        higher_array << value
      end
    end

    Quicksort.sort(lower_array) + pivot_duplicates + Quicksort.sort(higher_array)
  end
end


class Testing < Minitest::Test
  def test_quicksort
    assert_equal [1,2,3,4], Quicksort.sort([3,2,1,4])
    assert_equal [1,2,3,3,3,3,3,3,3,4], Quicksort.sort([3,2,3,3,1,3,3,4,3,3])
    assert_equal [-1,0,1,2], Quicksort.sort([-1,0,1,2])
    assert_equal [-1,0,1,2], Quicksort.sort([2,0,1,-1])
    assert_equal [-1,0,1,2], Quicksort.sort([2,1,0,-1])
    assert_equal [-1,-1,1,1,2,2], Quicksort.sort([1,2,1,2,-1,-1])
  end
end
