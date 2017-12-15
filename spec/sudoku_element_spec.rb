require_relative "../lib/sudoku_element"

describe SudokuElement do
  it "responds as an array" do
    expect {
      SudokuElement.new([]).map
      SudokuElement.new([[]]).transpose
    }.not_to raise_error
  end

  describe "#valid?" do
    it "returns true if each element of each member is unique exlcuding zero" do
      rows = [
        [1,2,3,4,5,6,7,0,9],
        [0,0,3,4,5,6,7,8,9]
      ]

      result = SudokuElement.new(rows).valid?

      expect(result).to be true
    end

    it "returns false if each element of each member is not unique exlcuding zero" do
      rows = [
        [1,1,1,1,1,1,1,1,1],
        [0,0,3,4,5,6,7,8,9]
      ]

      result = SudokuElement.new(rows).valid?

      expect(result).to be false
    end
  end
end
