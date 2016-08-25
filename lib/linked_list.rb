class LinkedList
attr_reader :head, :valid, :valid_beats

  def initialize
    @head = nil
    @valid_beats = %w| blop boop bop dah dee deep ding ditt doo doom doop dop hoo la na oom plop shi shu suu tee woo |
    @valid = false
  end

  def valid?(sound)
    if @valid_beats.include?(sound)
      @valid = true
    else
      @valid = false
    end
  end

  def append(sound)
    if valid?(sound)
      if @head == nil
        @head = Node.new(sound)
        @head.data
      else
        current_node = @head
        while current_node.next_node != nil
          current_node = current_node.next_node
        end
        current_node.next_node = Node.new(sound)
        current_node.next_node.data
      end
    else
      "Beat not valid!"
    end
  end

  def prepend(sound)
    if valid?(sound)
      if @head == nil
        @head = Node.new(sound)
        @head.data
      else
        current_node = Node.new(sound)
        current_node.next_node = @head
        @head = current_node
      end
      current_node.data
    else
      "Beat not valid!"
    end
  end

  def insert(index, sound)
    if valid?(sound)
      node_counter = 0
      current_node = @head
      while node_counter != index - 1
        current_node = current_node.next_node
        node_counter += 1
      end
        new_node = Node.new(sound)
        previous_node = current_node
        current_node = current_node.next_node
        new_node.next_node = current_node
        previous_node.next_node = new_node
        new_node.data
    else
      "Beat not valid!"
    end
  end

  def find(index, quantity)
    current_node = @head
    output = ""
    index.times do
      current_node = current_node.next_node
    end
    quantity.times do
      output << current_node.data + " "
      current_node = current_node.next_node
    end
    output.chop
  end

  def includes?(sound)
    current_node = @head
    is_it_here = false
    until  current_node.next_node == nil
      if current_node.data == sound
        is_it_here = true
      end
      current_node = current_node.next_node
    end
    is_it_here
  end

  def pop(quantity = 1)
    removed = ""
    quantity.times do
      current_node = @head
      while current_node.next_node.next_node != nil
        current_node = current_node.next_node
      end
      removed << current_node.next_node.data + " "
      current_node.next_node = nil
    end
    removed.split.reverse.join(" ")
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
    all_sounds = ""
      while current_node.next_node != nil
        all_sounds << current_node.data + " "
        current_node = current_node.next_node
      end
      all_sounds << current_node.data
      all_sounds
  end
end
