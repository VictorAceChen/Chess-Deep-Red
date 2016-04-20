require_relative "board"
require_relative "player"

class Game
  def initialize
    @board = Board.new
    @board.setup
    @player1 = Player.new(@board)
    @player2 = Player.new(@board)
  end

  def run
    until @board.checkmate?
      pos = @player1.move
      @board.mark(pos)
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  Game.new.run
end
