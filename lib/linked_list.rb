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

  def find(index, quantity)
    # edge case check for list length vs index + quantity
    # node_counter = 0
    current_node = @head
    output = ""
    # step to the index in the list
    index.times do
      current_node = current_node.next_node
    end
    # grab as many words as is in quantity
    quantity.times do
      output << current_node.data + " "
      current_node = current_node.next_node
    end
    output.chop
  end

  def includes?(data)
    current_node = @head
    is_it_here = false
    until  current_node.next_node == nil
      if current_node.data == data
        is_it_here = true
      end
      current_node = current_node.next_node
    end
    is_it_here
  end

  def pop(num = 1)
    removed_sound = []
    num.times do
      current_node = @head
      while current_node.next_node.next_node != nil
        current_node = current_node.next_node
        # require 'pry'; binding.pry
      end
      removed_sound << current_node.next_node.data
      current_node.next_node = nil
    end
    removed_sound.reverse.join(' ')
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
