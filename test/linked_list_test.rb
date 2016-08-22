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
end

# def test_it_looks_the_way_it_is_expected
#   list = LinkedList.new
#
# end
# > list = LinkedList.new
# => <LinkedList head=nil #45678904567>
# > list.head
# => nil
# > list.append("doop")
# => "doop"
# > list
# => <LinkedList head=<Node data="doop" next_node=nil #5678904567890> #45678904567>
# > list.head.next_node
# => nillist
# > list.count
# => 1
# > list.to_string
# => "doop"
