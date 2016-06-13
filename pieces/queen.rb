require_relative "type/sliding_piece"

class Queen < SlidingPiece
  def valid_moves
    super
    self.diagonals + self.perpendiculars
  end

end
