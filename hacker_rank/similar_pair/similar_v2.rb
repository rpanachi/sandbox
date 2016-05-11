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
    debug "add(#{position}, #{num})"
    i = position
    while(i <= size) do
      map[i] ||= 0
      map[i] += num
      i += lowbit(i)
    end
  end
  def sum(num, acc = 0)
    debug "sum(#{num}, #{acc})"
    return num if num == 0
    return acc if num <= 0

    acc = sum(num - lowbit(num), acc)
    acc += map[num] || 0

    return acc
  end

  def debug(message, level = 1)
    puts message if ENV["DEBUG"] == "true"
  end
end

class Similar
  attr_reader :stream, :n, :t, :result

  def initialize(stream)
    @stream = stream
  end

  def run
    @n, @t = read_pair || [0, 0]

    return if n < 1 || n > 100_000
    return if t < 0 || t > n

    @bit = BinaryIndexTree.new(n)
    @adj = []
    @deg = []

    main
  end

  def dfs(u)
    debug "dfs(#{u})"

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
    @result = 0

    i = 1
    while(i < n) do
      s, e = read_pair

      @adj[s] ||= []
      @adj[s] << e

      @deg[e] ||= 0
      @deg[e] += 1

      i += 1
    end

    root = 0
    i    = 1
    while(i < n) do
      if @deg[i] == nil || @deg[i] == 0
        root = i
        break
      end
      i += 1
    end

    @result = 0
    dfs(root)

    return @result
  end

  private

  def read_pair
    line = stream.gets
    line.split(" ").map(&:to_i)
  rescue
    nil
  end

  def debug(message, level = 1)
    puts message if ENV["DEBUG"] == "true"
  end
end

similar = Similar.new(STDIN)
similar.run

puts similar.result
