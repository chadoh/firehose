class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def print_values(list_node)
  print "#{list_node.value} --> "

  if infinite_list?(list_node)
    mu, lam = repetition_params(list_node)
    (mu + lam).times do
      list_node = list_node.next_node
      print "#{list_node.value} --> "
    end
    print "(and then starts repeating)\n"
  else
    if list_node.next_node.nil?
      print "nil\n"
      return
    else
      print_values(list_node.next_node)
    end
  end
end

def infinite_list?(list_node)
  tortoise = list_node.next_node
  hare = list_node.next_node.next_node
  count = 0
  while tortoise.value != hare.value
    count += 1
    tortoise = tortoise.next_node
    hare = hare.next_node.next_node
  end

  mu = 0
  tortoise = list_node
  while tortoise.value != hare.value
    tortoise = tortoise.next_node
    hare = hare.next_node
    mu += 1
  end

  lam = 1
  hare = tortoise.next_node
  while tortoise.value != hare.value
    hare = hare.next_node
    lam +=1
  end

  return mu, lam
rescue NoMethodError
  false
end
alias :repetition_params :infinite_list?

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node1.next_node = node3

node4 = LinkedListNode.new(1)
node5 = LinkedListNode.new(2, node4)
node6 = LinkedListNode.new(3, node5)

# require 'pry'; binding.pry
# infinite_list?(node3)
# infinite_list?(node6)

print_values(node3)

print "-------\n"

print_values(node6)
