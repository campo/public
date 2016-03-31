require 'minitest/autorun'

class Set
  def initialize
    @storage_hash = {}
  end

  def add(key)
    @storage_hash[key] = true
    true
  end

  def delete(key)
    @storage_hash.delete(key)
    true
  end

  def to_a
    @storage_hash.keys
  end

  def include?(key)
    if @storage_hash[key]
      return true
    end
    false
  end

  def size
    @storage_hash.keys.size
  end
end


class Testing < Minitest::Test
  def setup
    @test = Set.new
  end

  def test_set
    assert_equal true, @test.add("A")
    assert_equal true, @test.add("A")
    assert_equal true, @test.add("A")
    assert_equal ["A"], @test.to_a
    assert_equal true, @test.add("B")
    assert_equal true, @test.add("B")
    assert_equal ["A", "B"], @test.to_a
    assert_equal true, @test.delete("A")
    assert_equal ["B"], @test.to_a
    assert_equal false, @test.include?("A")
    assert_equal true, @test.include?("B")
    assert_equal 1, @test.size
    assert_equal true, @test.delete("B")
    assert_equal 0, @test.size
  end
end
