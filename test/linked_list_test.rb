require 'pry'
require './test/test_helper'
require './lib/linked_list'

class LinkedListTest < Minitest::Test
  def test_its_head_is_nil_at_start
    list = LinkedList.new
    assert_equal nil, list.head
  end

  def test_valid_beats_collectoins_exists
    list = LinkedList.new

    assert list.valid_beats
    assert_instance_of Array, list.valid_beats
  end

  def test_it_appends_a_sound
    list = LinkedList.new

    assert_equal "doop", list.append("doop")
    assert_equal "doop", list.head.data
    assert_equal nil, list.head.next_node
  end

  def test_it_appends_multiple_sounds
    list = LinkedList.new

    assert_equal "doop", list.append("doop")
    assert_equal nil, list.head.next_node

    list.append("deep")
    assert list.head.next_node
    assert_equal 2, list.count
    assert_equal "doop deep", list.to_string

    list.append("dop")
    assert_equal 3, list.count
    assert_equal "doop deep dop", list.to_string
  end

  def test_it_prepends_data
    list = LinkedList.new

    assert_equal "plop", list.append("plop")
    assert_equal "dop", list.prepend("dop")
    assert_equal "doop", list.prepend("doop")
    assert_equal "doop dop plop", list.to_string
  end

  def test_it_inserts_data_in_given_position
    list = LinkedList.new
    list.append("dop")
    list.append("plop")
    list.append("suu")

    assert_equal "dop plop suu", list.to_string
    assert_equal "woo", list.insert(1, "woo")
    assert_equal "dop woo plop suu", list.to_string
    assert_equal"doom", list.insert(2, "doom")
    assert_equal "dop woo doom plop suu", list.to_string
  end

  def test_it_checks_entered_sound_is_valid
    list = LinkedList.new

    assert list.valid?("doop")
    refute list.valid?("shute")
    assert_equal "Beat not valid!", list.append("xxx")
    assert_equal "Beat not valid!", list.prepend("xxx")
    assert_equal "Beat not valid!", list.insert(0, "xxx")
  end

  def test_it_pulls_the_right_number_of_sounds_at_given_index
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    assert_equal "deep woo shi shu blop", list.to_string
    assert_equal "shi", list.find(2, 1)
    assert_equal "blop", list.find(4, 1)
    assert_equal "shi shu blop", list.find(2, 3)
    assert_equal  "woo shi shu blop", list.find(1, 4)
  end

  def test_it_can_look_for_a_sound_in_the_list
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    assert list.includes?("shu")
    refute list.includes?("bop")
  end

  def test_it_pops_the_given_number_of_sounds
    list = LinkedList.new
    list.append("deep")
    list.append("woo")
    list.append("shi")
    list.append("shu")
    list.append("blop")

    assert_equal "deep woo shi shu blop", list.to_string
    assert_equal "blop", list.pop
    assert_equal "deep woo shi shu", list.to_string
    assert_equal "woo shi shu", list.pop(3)
    assert_equal "deep", list.to_string
  end

  def test_it_counts_data
    list = LinkedList.new

    assert_equal "No data!", list.count

    list.append("doop")
    assert_equal 1, list.count

    list.append("shi")
    list.append("shu")
    list.append("blop")
    assert_equal 4, list.count
  end

  def test_it_converts_sounds_to_string
    list = LinkedList.new

    list.append("doop")
    assert_equal "doop", list.to_string

    list.append("shi")
    list.append("shu")
    list.append("blop")
    assert_equal "doop shi shu blop", list.to_string
  end
end
