# Represents a group of rows, columns, or subgroups
class SudokuElement < SimpleDelegator
  def initialize(members)
    @members = members
    super
  end

  def valid?
    all_members_have_unique_elements_exlcuding_zero?
  end

  private

  def all_members_have_unique_elements_exlcuding_zero?
    members_with_zeroes_stripped.all? { |member| member.uniq == member }
  end

  def members_with_zeroes_stripped
    @members.map do |member|
      member.reject { |element| element == 0 }
    end
  end
end
