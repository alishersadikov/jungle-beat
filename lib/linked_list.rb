require_relative 'node'

class LinkedList
attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    if @head == nil
      @head = Node.new(data)
    else
      current_node = @head
      while current_node.next_node != nil
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new(data)
    end
  end

  def prepend(data)
    if @head == nil
      @head = Node.new(data)
    else
      current_node = Node.new(data)
      current_node.next_node = @head
      @head = current_node
    end
  end

  def insert(index, data)
    node_counter = 0
    current_node = @head
    while node_counter != index - 1
      current_node = current_node.next_node
      node_counter += 1
    end
      new_node = Node.new(data)
      previous_node = current_node
      current_node = current_node.next_node
      new_node.next_node = current_node
      previous_node.next_node = new_node
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
    current_node = @head
    all_data = ""
      while current_node.next_node != nil
        all_data << current_node.data + " "
        current_node = current_node.next_node
      end
      all_data << current_node.data
  end
end
