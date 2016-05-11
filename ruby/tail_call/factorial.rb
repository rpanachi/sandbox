def factorial(n)
  raise InvalidArgument, "negative input given" if n < 0

  return 1 if n == 0
  return factorial(n - 1) * n
end
