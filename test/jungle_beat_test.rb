require './test/test_helper'
require './lib/jungle_beat'
require './lib/linked_list'

class JungleBeatTest < Minitest::Test

  def test_it_has_linked_list_as_an_attribute
    jb = JungleBeat.new

    refute_equal nil, jb
    assert_instance_of LinkedList, jb.list
    assert_equal nil, jb.list.head
  end

  def test_it_appends_a_string
    jb = JungleBeat.new

    assert_equal "deep doo ditt blop", jb.append("deep doo ditt blop")
    assert_equal "deep", jb.list.head.data
    assert_equal "doo", jb.list.head.next_node.data
    assert_equal "woo suu hoo shu", jb.append("woo suu hoo shu")
    assert_equal 8, jb.count
  end

  def test_it_plays_the_sounds
    jb = JungleBeat.new

    expected = "deep doo ditt woo hoo shu dah suu boop tee doom dee"
    actual = jb.append("deep doo ditt woo hoo shu dah suu boop tee doom dee")
    assert_equal expected, actual

    assert_equal 12, jb.count
    assert_equal 12, jb.list.count

    expected = "deep doo ditt woo hoo shu dah suu boop tee doom dee"
    actual = jb.beats
    assert_equal expected, actual

    assert_equal "", jb.play
    jb.play
  end
end
