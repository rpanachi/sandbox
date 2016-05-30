def factorial(n)
  raise InvalidArgument, "negative input given" if n < 0

  result = 1
  for i in (1..n) do
    result *= i
  end
  result
end
