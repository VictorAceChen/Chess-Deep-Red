require_relative "type/sliding_piece"

class Rook < SlidingPiece
  def valid_moves
    self.perpendiculars
  end
end
