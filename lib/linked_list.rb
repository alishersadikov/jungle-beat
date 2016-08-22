require_relative 'node'

class LinkedList
attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    @head = Node.new(data)
  end

  def count
    if @head == nil
      "No data!"
    else
      node_counter = 1
      current_node = @head
      while current_node.next_node != nil
        node_counter += 1
        current_node = current_node.next_node
      end
      node_counter
    end
  end

  def to_string
    @head.data
  end
end
