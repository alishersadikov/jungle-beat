require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < Minitest::Test

  def test_it_can_pull_data_from_node
    node = Node.new("plop")
    assert_equal "plop", node.data
  end

  def test_it_the_next_node_data_is_nil
    node = Node.new("plop")
    assert_equal nil, node.next_node
  end
end
