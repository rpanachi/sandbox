#!/bin/ruby

def balanced(string)
  chars = []
  string.to_s.each_char do |char|
    if ["{", "[", "("].include?(char)
      chars << char
    else
      last    = chars.last
      return false unless last

      chars.pop if (char == ")" && last == "(") ||
        (char == "]" && last == "[") ||
        (char == "}" && last == "{")
    end
  end
  chars.empty?
end

t = gets.strip.to_i
for a0 in (0..t-1)
  s = gets.strip
  puts balanced(s) ? "YES" : "NO"
end
