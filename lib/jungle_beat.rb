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

  def beats
    @beats = @list.to_string
  end

  def play
    `say -r 500 -v Boing #{beats}`
  end
end
