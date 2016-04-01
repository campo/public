require 'minitest/autorun'

class LinkedListNode
  attr_accessor :value
  attr_accessor :next

  def initialize(value)
    @value = value
    @next = nil
  end

  def to_a
    return [@value] if @next.nil?
    [@value] + @next.to_a
  end

  def to_s
    to_a.join(", ")
  end
end

# Runtime: O(n) - We go through the whole list one time
# Space: O(1) - We do this in place, no extra space needed.
def reverse(head)
  return head if head.nil?
  return head if head.next.nil?

  current = head
  previous = nil

  while current
    next_node = current.next
    current.next = previous
    previous = current
    current = next_node
  end

  previous
end

# Runtime: O(n) - We go through the whole list one time
# Space: O(n) - We create one copy of the entire list
def reverse_out_of_place(head)
  return nil if head.nil?
  return LinkedListNode(head.value) if head.next.nil?

  current = head
  previous = nil

  while current
    # Prepare to go to next node in original list
    next_node = current.next

    # Create a copy of current node and set next to
    # copy of last node
    current_copy = LinkedListNode.new(current.value)
    current_copy.next = previous
    previous = current_copy

    # Move on to next node in original list
    current = next_node
  end

  # Return when current gets set to nil
  # We're at the end of the list
  previous
end

class Testing < Minitest::Test
  def setup
    # Setup for in place testing
    @a = LinkedListNode.new("A")
    @b = LinkedListNode.new("B")
    @c = LinkedListNode.new("C")
    @a.next = @b
    @b.next = @c

    # Setup for out of place testing
    @d = LinkedListNode.new("D")
    @e = LinkedListNode.new("E")
    @f = LinkedListNode.new("F")
    @d.next = @e
    @e.next = @f
  end

  def test_in_place
    assert_equal ["C","B","A"], reverse(@a).to_a
  end

  def test_out_of_place
    assert_equal "D, E, F", @d.to_s
    assert_equal ["D","E","F"], @d.to_a
    assert_equal ["F","E","D"], reverse_out_of_place(@d).to_a
  end
end
