require "./tail_call_optimization"

class Calculator
  extend TailCallOptimization

  tail_recursive def factorial(n, accumulator = 1)
    raise InvalidArgument, "negative input given" if n < 0

    return accumulator if n == 0
    return factorial(n - 1, accumulator * n)
  end
end
