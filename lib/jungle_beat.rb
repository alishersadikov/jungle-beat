class JungleBeat
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(string)
    sounds = string.split
    sounds.map { |sound| @list.append(sound).data }.join(" ")
  end

  def count
    @list.count
  end
end
