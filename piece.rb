class Piece

  def initialize(board, color)
    @pos = nil
    @board = board
    @color = color
  end

  def moves

  end

  def set_position=(pos)
    @pos = pos

  end
end

class SlidingPiece < Piece

  def move_dirs
  end
end


class Bishop < SlidingPiece

end

class Rook < SlidingPiece

end

class Queen < SlidingPiece

end

class SteppingPiece < Piece

end

class Knight < SteppingPiece

end

class King < SteppingPiece

end

class Pawn < Piece

end
