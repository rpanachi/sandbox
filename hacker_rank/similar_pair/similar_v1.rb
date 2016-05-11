def read_pair
  line = gets
  line.split(" ").map(&:to_i)
rescue
  nil
end

n, t  = read_pair || [0, 0]

exit(0) if n < 1 || n > 100_000
exit(0) if t < 0 || t > n

map     = []
similar = 0

rows = n - 1
rows.times.each do |i|
  s, e    = read_pair
  current = e
  map[e]  = s

  while(map[e] != nil) do
    parent = map[e]
    if ((parent - current).abs <= t)
      similar += 1
    end
    e = parent
  end
end

puts similar
