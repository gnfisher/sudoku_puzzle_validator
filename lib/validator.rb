require_relative "sudoku_element"
require_relative "sudoku_puzzle"

class Validator
  def self.validate(puzzle_string)
    new(puzzle_string).validate
  end

  def initialize(puzzle_string)
    @puzzle = SudokuPuzzle.new(puzzle_string)
  end

  def validate
    if complete? && valid?
      "This sudoku is valid."
    elsif valid?
      "This sudoku is valid, but incomplete."
    else
      "This sudoku is invalid."
    end
  end

  private

  attr_reader :puzzle

  def complete?
    puzzle.complete?
  end

  def valid?
    [rows, cols, subgroups].all?(&:valid?)
  end

  def rows
    @rows ||= SudokuElement.new(puzzle.rows)
  end

  def cols
    @cols ||= SudokuElement.new(puzzle.cols)
  end

  def subgroups
    @subgroups ||= SudokuElement.new(puzzle.subgroups)
  end
end
