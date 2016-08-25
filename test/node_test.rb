require './test/test_helper'
require './lib/node'

class NodeTest < Minitest::Test

  def test_node_data_is_nil_at_start
    node = Node.new
    assert_equal nil, node.data
  end

  def test_it_stores_and_pulls_data_from_node
    node = Node.new("plop")
    assert_equal "plop", node.data
  end

  def test_it_the_next_node_data_is_nil
    node = Node.new("plop")
    assert_equal nil, node.next_node
  end
end
