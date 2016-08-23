require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/jungle_beat'
require './lib/linked_list'

class JungleBeatTest < Minitest::Test

  def test_it_has_list_as_an_attribute
    jb = JungleBeat.new

    refute_equal nil, jb
    assert_instance_of LinkedList, jb.list
    assert_equal nil, jb.list.head
  end

  def test_it_appends_a_string
    jb = JungleBeat.new

    assert_equal "deep doo ditt", jb.append("deep doo ditt")
    assert_equal "deep", jb.list.head.data
    assert_equal "doo", jb.list.head.next_node.data
    assert_equal "woo hoo shu", jb.append("woo hoo shu")
    assert_equal 6, jb.count
  end

  def test_it_plays_the_sounds
    jb = JungleBeat.new

    assert_equal "deep doo ditt woo hoo shu", jb.append("deep doo ditt woo hoo shu")
    assert_equal 6, jb.count
    assert_equal 6, jb.list.count
    assert_equal "deep doo ditt woo hoo shu", jb.beats

    jb.play
    jb.play
    jb.play
  end
end
