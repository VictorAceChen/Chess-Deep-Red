class Piece
  PIECEMAP = {
    "Rook" => "♜",
    "Bishop" => "♝",
    "Knight" => "♘",
    "King" => "♚",
    "Queen" => "♛",
    "Pawn" => "♟"
  }
  attr_reader :color
  attr_accessor :pos

  def initialize(board, color, pos = nil)
    @pos = pos
    @board = board
    @color = color
  end

  def friendly?(pos)
    return false if @board[pos].nil?
    return true if  @board[pos].color == color
    false
  end

  def valid_direction(directions)
    return [] if directions.empty? || @pos.empty?
    x, y = @pos

    directions = directions.map{ |arr| [arr.last + x,arr.first + y] } #from current piece position
    directions = directions.select{ |arr| arr.first.between?(0,7) && arr.last.between?(0,7) } #remove out of bounds
    directions.select{ |arr| !friendly?(arr) }
  end

  def valid_moves
    return [] if @pos.empty?
  end

  def to_s
    class_str = self.class.to_s
    PIECEMAP[class_str]
  end

end

class SlidingPiece < Piece

  def slide(directions)
    return [] if @pos.empty?
    moves = []
    x, y = @pos
    directions.each do |direction|

      x += direction.first
      y += direction.last # had to duplicate for a single instance for white bottom row

      while x.between?(0, 7) && y.between?(0, 7)

        if @board[[x,y]].nil?
          moves << [x,y]
        else
          moves << [x,y] unless self.friendly?([x,y])
          break
        end

        x += direction.first
        y += direction.last
      end
      x, y = @pos
    end
    moves
  end

  def diagonals
    directions = [[1, 1],[-1, -1],[1, -1],[-1, 1]]
    slide(directions)
  end

  def perpendiculars
    directions = [[1, 0],[-1, 0],[0, -1],[0, 1]]
    slide(directions)
  end
end


class Bishop < SlidingPiece
  def valid_moves
    self.diagonals
  end
end

class Rook < SlidingPiece
  def valid_moves
    self.perpendiculars
  end
end

class Queen < SlidingPiece
  def valid_moves
    super
    self.diagonals + self.perpendiculars
  end
end

class SteppingPiece < Piece

end

class Knight < SteppingPiece
  def valid_moves
    half_directions = [[1, 2],[-1, -2],[1, -2],[-1, 2]]
    directions = half_directions + half_directions.map{ |arr| [arr.last,arr.first] }
    valid_direction(directions)
  end
end

class King < SteppingPiece
  def valid_moves
    directions = [[1, 1], [0, 1], [1, 0], [-1, 1], [1, -1], [-1, 0], [0, -1], [-1, -1]]
    valid_direction(directions)
  end
end

class Pawn < Piece
  def valid_moves
    super
    x, y = @pos
    return [] if (x == 7 && color == :black) || (x == 0 && color == :white)
    upDown = color == :black ? 1 : -1
    directions = []
      walk = [x + upDown, y]
      if @board[walk].nil?
        directions << walk
        walk = [x + upDown * 2, y]
        start_row = self.color == :black ? 1 : 6
          directions << walk if @board[walk].nil? && x == start_row
      end
      attack = [x + upDown, y + upDown]
      directions << attack if !@board[attack].nil? && @board[attack].color != color
      attack = [x + upDown, y - upDown]
      directions << attack if !@board[attack].nil? && @board[attack].color != color
      directions
  end
end
