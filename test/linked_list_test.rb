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

  def test_it_prepends_data
    list = LinkedList.new
    list.append("plop")

    assert_equal "plop", list.to_string

    list.prepend("dop")
    assert_equal "dop plop", list.to_string

    list.prepend("doop")
    assert_equal "doop dop plop", list.to_string
  end

  def test_it_inserts_data_in_relevant_position
    list = LinkedList.new
    list.append("dop")
    list.append("plop")
    list.append("suu")

    list.insert(1, "woo")

    assert_equal "dop woo plop suu", list.to_string

    list.insert(2, "doom")

    assert_equal "dop woo doom plop suu", list.to_string
  end
  def test_it_finds_the_data_at_given_index
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    assert_equal "shi", list.find(2, 1)

  end 


end
