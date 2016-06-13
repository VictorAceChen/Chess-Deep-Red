require_relative "type/sliding_piece"

class Bishop < SlidingPiece
  def valid_moves
    self.diagonals
  end
end
