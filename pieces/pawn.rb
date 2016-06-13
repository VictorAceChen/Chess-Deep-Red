require_relative "type/piece"

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
