class CalculateChecksum
  def execute(input)
    double_count = 0
    triple_count = 0

    input.split.each do |id|
      char_counts = id.chars.group_by(&:itself).values.map(&:count)
      double_count += 1 if char_counts.include?(2)
      triple_count += 1 if char_counts.include?(3)
    end

    double_count * triple_count
  end
end
