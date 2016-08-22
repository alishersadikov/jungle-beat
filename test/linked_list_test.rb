require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'

class LinkedListTest < Minitest::Test

  def test_its_head_equals_nil
    list = LinkedList.new

    assert_equal nil, list.head
  end

  def test_it_appends_data
    list = LinkedList.new
    list.append("doop")

    assert_equal "doop", list.head.data
    assert_equal nil, list.head.next_node
  end

  def test_it_counts_data
    list = LinkedList.new

    assert_equal "No data!", list.count

    list.append("doop")

    assert_equal 1, list.count
  end

  def test_it_converts_data_to_string
    list = LinkedList.new
    list.append("doop")

    assert_equal "doop", list.to_string
  end

  def test_it_appends_the_second_node
    list = LinkedList.new
    list.append("doop")

    assert_equal nil, list.head.next_node
    list.append("deep")

    assert list.head.next_node

    assert_equal 2, list.count
    assert_equal "doop deep", list.to_string
  end
end
