def read_pair
  line = gets
  line.split(" ").map(&:to_i)
rescue
  nil
end

@n, @t  = read_pair || [0, 0]

exit(0) if @n < 1 || @n > 100_000
exit(0) if @t < 0 || @t > @n

class BinaryIndexTree
  attr_reader :size, :map

  def initialize(size)
    @size = size
    @map  = Array.new(size)
  end

  def lowbit(num)
    return num & (-num)
  end

  def add(position, num)
    i = position
    while(i <= size) do
      map[i] ||= 0
      map[i] += num
      i += lowbit(i)
    end
  end

  def sum(num)
    return num if num == 0

    result = 0
    i = num
    while(i > 0) do
      result += map[i] || 0
      i -= lowbit(i)
    end

    result
  end
end

@adj = []
@deg = []
@result = 0

def dfs(u)
  sum_min = @bit.sum([@n, u + @t].min)
  sum_max = @bit.sum([1, u - @t].max - 1)
  @result += sum_min - sum_max

  @bit.add(u, 1)

  i = 0
  while(@adj[u] && i < @adj[u].size) do
    v = @adj[u][i]
    dfs(v)
    i += 1
  end

  @bit.add(u, -1)
end

def main
  @bit = BinaryIndexTree.new(@n)

  i = 1
  while(i < @n) do
    s, e = read_pair
    @adj[s] ||= []
    @adj[s] << e

    @deg[e] ||= 0
    @deg[e] += 1

    i += 1
  end

  root = 0
  i    = 1
  while(i < @n) do
    if @deg[i].to_i == 0
      root = i
      break
    end
    i += 1
  end

  @result = 0
  dfs(root)

  return @result
end

puts main
