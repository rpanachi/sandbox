def matchDonuts(donutConstraintPairs, candidateConstraintPairs)
  types = Hash[donutConstraintPairs.map do |donut, type|
    [type, donut]
  end]

  pairs = []
  candidateConstraintPairs.map do |people, type|
    next if people.nil? || type.nil?

    if type == "*"
      types.each do |donut, dtype|
        pairs << [people, dtype]
      end
    elsif type != nil || type != ""
      if likes = types[type]
        pairs << [people, likes]
      end
    end
  end

  pairs.sort
end

fp = File.open(ENV['OUTPUT_PATH'], 'w')

_donutConstraintPairs_rows = 0
_donutConstraintPairs_cols = 0
_donutConstraintPairs_rows = Integer(gets)
_donutConstraintPairs_cols = Integer(gets)
_donutConstraintPairs = Array.new(_donutConstraintPairs_rows)
for _donutConstraintPairs_i in (0.._donutConstraintPairs_rows-1)
  _donutConstraintPairs_t = gets.strip
  _donutConstraintPairs[_donutConstraintPairs_i] = _donutConstraintPairs_t.split(' ')
end

_candidateConstraintPairs_rows = 0
_candidateConstraintPairs_cols = 0
_candidateConstraintPairs_rows = Integer(gets)
_candidateConstraintPairs_cols = Integer(gets)
_candidateConstraintPairs = Array.new(_candidateConstraintPairs_rows)
for _candidateConstraintPairs_i in (0.._candidateConstraintPairs_rows-1)
  _candidateConstraintPairs_t = gets.strip
  _candidateConstraintPairs[_candidateConstraintPairs_i] = _candidateConstraintPairs_t.split(' ')
end

res = matchDonuts(_donutConstraintPairs, _candidateConstraintPairs);
res.each do |res_x|
  res_x.each do |res_y|
    fp.write res_y;
    fp.write " ";
  end
  fp.write "\n";
end
fp.close()
