require 'minitest/autorun'

class Queue
  def initialize
    @storage = []
  end

  def enqueue(value)
    @storage << value
    true
  end

  def dequeue
    @storage.delete_at(0)
  end
end

class Testing < Minitest::Test
  def setup
    @test = Queue.new
  end

  def test_queue
    assert_equal true, @test.enqueue("A")
    assert_equal true, @test.enqueue("B")
    assert_equal true, @test.enqueue("C")
    assert_equal "A", @test.dequeue
    assert_equal "B", @test.dequeue
    assert_equal "C", @test.dequeue
    assert_equal nil, @test.dequeue
  end
end
