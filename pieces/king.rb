require_relative "type/stepping_piece"

class King < SteppingPiece
  def valid_moves
    directions = [[1, 1], [0, 1], [1, 0], [-1, 1], [1, -1], [-1, 0], [0, -1], [-1, -1]]
    filtered_moves(directions)
  end
end
