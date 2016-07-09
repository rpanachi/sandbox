class Node < Struct.new(:data, :next)
end

def hasCycle(node)
  slow = node
  fast = node

  while(fast != nil && fast.next != nil)
    slow = slow.next
    fast = fast.next.next

    puts "slow: #{slow.data}, fast: #{fast.data}" if ENV["debug"]

    return true if slow == fast
  end

  return false
end

n1 = Node.new(1, nil)
n2 = Node.new(2, nil)
n3 = Node.new(3, nil)
n4 = Node.new(4, nil)

# Scenario 1
puts "1 -> 2 -> 3 -> 2"
n1.next = n2
n2.next = n3
n3.next = n2

puts hasCycle(n1) # true

# Scenario 2
puts "1 -> 2 -> 3 -> 4 -> 1"
n1.next = n2
n2.next = n3
n3.next = n4
n4.next = n1

puts hasCycle(n1) # true

# Scenario 3
puts "1 -> 2 -> 3"
n1.next = n2
n2.next = n3
n3.next = nil

puts hasCycle(n1) # false

