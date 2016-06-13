require_relative "type/stepping_piece"

class Knight < SteppingPiece
  def valid_moves
    half_directions = [[1, 2],[-1, -2],[1, -2],[-1, 2]]
    directions = half_directions + half_directions.map{ |arr| [arr.last,arr.first] }
    filtered_moves(directions)
  end
end
