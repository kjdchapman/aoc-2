class FindSimilarCodes
  def execute(input)
    codes = input.split

    codes.each do |code|
      codes.each do |match|
        different_index = 0

        different_chars = code.chars.each_with_index.count do |char, index|
          different = char != match.chars[index]
          different_index = index if different
          different
        end

        if different_chars == 1
          code.slice!(different_index)
          return code
        end
      end
    end
  end
end
