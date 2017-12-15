class SudokuPuzzleGroup
  def intialize(group)
    @group = group
  end

  def valid?
    group.all? { |row| row == row.uniq }
  end
end
