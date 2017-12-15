require_relative "../lib/sudoku_puzzle"

describe SudokuPuzzle do

  describe "#rows" do
    it "returns an array of rows from puzzle" do
      puzzle_string = <<~TEXT
        8 5 0 |0 0 2 |4 0 0
        7 2 0 |0 0 0 |0 0 9
        0 0 4 |0 0 0 |0 0 0
        ------+------+------
      TEXT

      result = SudokuPuzzle.new(puzzle_string).rows

      expect(result.size).to eq 3
      expect(result.first).to eq([8,5,0,0,0,2,4,0,0])
      expect(result.last).to eq([0,0,4,0,0,0,0,0,0])
    end
  end

  describe "#cols" do
    it "returns an array of cols from puzzle" do
      puzzle_string = <<~TEXT
        8 5 0 |0 0 2 |4 0 0
        7 2 0 |0 0 0 |0 0 9
        0 0 4 |0 0 0 |0 0 0
        ------+------+------
      TEXT

      result = SudokuPuzzle.new(puzzle_string).cols

      expect(result.size).to eq 9
      expect(result.first).to eq([8,7,0])
      expect(result.last).to eq([0,9,0])
    end
  end

  describe "#subgroups" do
    it "returns an array of subgroups from puzzle" do
      puzzle_string = <<~TEXT
        8 5 0 |0 0 2 |4 0 0
        7 2 0 |0 0 0 |0 0 9
        0 0 4 |0 0 0 |0 0 0
        ------+------+------
      TEXT

      result = SudokuPuzzle.new(puzzle_string).subgroups

      expect(result.size).to eq 3
      expect(result.first).to eq([8,5,0,7,2,0,0,0,4])
      expect(result.last).to eq([4,0,0,0,0,9,0,0,0])
    end
  end
end
