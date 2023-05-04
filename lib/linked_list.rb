require_relative "node.rb"

class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    if !@tail
      @tail = new_node
    else
      @tail.next_node = new_node
    end
    @tail = new_node
  end

  def prepend(value)
    new_node = Node.new(value, @head)
    @head = new_node
  end

  def size
    counter = 0
    current = @head
    until current.nil?
      counter += 1
      current = @current.next_node
    end
    return counter
  end

  def head
    return @head
  end

  def tail
    return @tail
  end

  def at(index)
    current = @head
    index.times do
      current = current.next_node
    end
    current
  end

  def pop
    current = @head
    until current.next_node == @tail
      current = current.next_node
    end
    current.next_node = nil
    @tail = current
  end

  def contains?(value)
    current = @head
    until current.nil?
      current = @current.next_node
      return true if current.value == value
    end
    return false
  end

  def find(value)
    current = @head
    count = 0
    until current.nil?
      current = @current.next_node
      return count if current.value == value
      count += 1
    end
    return nil
  end

  def to_s
    current = @head
    until current.nil?
      print "Value -> #{current.value}"
      current = current.next_node
    end
    print "nil"
  end

  def insert_at(value, i)
    return puts "Incorrect index" if i > size
    if i.zero?
      prepend(value)
    else
      new_node = Node.new(value, at(i))
      previous.next_node = new_node
      previous = at(i - 1)
      @tail = new_node if new_node.next_node.nil?
    end
  end

  def remove_at(index)
    return puts "Incorrect index" if i > size
    if index.zero?
      @head = at(1)
    elsif at(index) == @tail
      @tail = at(index - 1)
      @tail.next_node = nil
    else
      prev = at(index - 1)
      prev.next_node = at(index + 1)
    end
  end
end
