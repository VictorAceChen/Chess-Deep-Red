
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

  def to_s
    # CLASSES_MAP[self.class]
    self.class.to_s[0]
  end
end

class SlidingPiece < Piece

  def move_dirs
  end
end


class Bishop < SlidingPiece
  def to_s
    'b'
  end
end

class Rook < SlidingPiece
  def to_s
    'R'
  end
end

class Queen < SlidingPiece
  def to_s
    'Q'
  end
end

class SteppingPiece < Piece

end

class Knight < SteppingPiece
  def to_s
    'k'
  end
end

class King < SteppingPiece
  def to_s
    'K'
  end
end

class Pawn < Piece
  def to_s
    'p'
  end
end
