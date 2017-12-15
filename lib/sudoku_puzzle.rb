class SudokuPuzzle
  NON_DIGIT_PATTERN = /[^\d]/
  NON_DIGIT_OR_ZERO_PATTERN = /([^\d]|0)/

  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
  end

  def complete?
    no_zeroes_or_missing_answers?
  end

  def rows
    @rows ||= puzzle_array.each_slice(9).to_a
  end

  def cols
    @cols ||= rows.transpose
  end

  def subgroups
    rows.
      map { |r| r.each_slice(3).to_a }.
      transpose.
      flatten.
      each_slice(9).
      to_a
  end

  private

  def puzzle_array
    @puzzle_string.gsub(NON_DIGIT_PATTERN, "").split("").map(&:to_i)
  end

  def no_zeroes_or_missing_answers?
    @puzzle_string.gsub(NON_DIGIT_OR_ZERO_PATTERN, "").split("").size == 81
  end
end
