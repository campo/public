require 'minitest/autorun'

class Stack
  def initialize
    @storage = []
  end

  def push(value)
    @storage << value
    true
  end

  def pop
    @storage.delete_at(@storage.size - 1)
  end
end

class Testing < Minitest::Test
  def setup
    @test = Stack.new
  end

  def test_stack
    assert_equal true, @test.push("A")
    assert_equal true, @test.push("B")
    assert_equal true, @test.push("C")
    assert_equal "C", @test.pop
    assert_equal "B", @test.pop
    assert_equal "A", @test.pop
    assert_equal nil, @test.pop
  end
end
