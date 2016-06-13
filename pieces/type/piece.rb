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

  def filtered_moves(moves)
    return [] if moves.empty? || @pos.empty?
    x, y = @pos

    #from current piece position
    moves = moves.map{ |arr| [arr.last + x,arr.first + y] }
    #remove moves that are out of bounds
    moves = moves.select{ |arr| arr.first.between?(0,7) && arr.last.between?(0,7) }
    #remove moves that include friendly pieces
    moves.select{ |arr| !friendly?(arr) }
  end

  def valid_moves
    return [] if @pos.empty?
  end

  def to_s
    class_str = self.class.to_s
    PIECEMAP[class_str]
  end

end
