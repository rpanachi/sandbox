# usage: echo 10000 | crystal run factorial.cr

require "big_int"

def factorial(n)
  return 1 if n <= 1
  return n * factorial(n - 1)
end

number = BigInt.new(gets.to_s)
result = factorial(number)

puts result.to_s.size
