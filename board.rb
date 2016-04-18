require "byebug"
require_relative "piece.rb"

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end

  def setup
    self.new_back_row(:black)
    self.new_back_row(:white)
    self.new_front_row(:black)
    self.new_front_row(:white)
  end

  def new_back_row(color)
    row = color == :black ? 7 : 0
    mold = [Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]

    pieces_array = mold.map { |el| el.new(self, color) }

    pieces_array.each_with_index do |piece, idx|
      piece.set_position = [row, idx]
    end

    @grid[row] = pieces_array
    # p pieces_array
  end

  def new_front_row(color)
    row = color == :black ? 6 : 1
    mold = [Pawn] * 8

    pieces_array = mold.map { |el| el.new(self, color) }

    pieces_array.each_with_index do |piece, idx|
      piece.set_position = [row, idx]
    end

    @grid[row] = pieces_array
  end

  def move(start, end_pos)

    # render
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  # def render
  #   classes = {
  #     Rook => "r", Knight => "k", Bishop => "b", King => "K", Queen => "Q",
  #     Pawn => "p"
  #   }
  #   puts "  #{('A'..'H').to_a.join(" ")}"
  #
  #   grid.each_with_index do |row, i|
  #     array = row.map { |piece| classes[piece.class] }.join(" ")
  #     puts "#{i} #{array}"
  #   end
  #
  # end

  def checkmate?
    false
  end

  def rows
    @grid
  end

  def in_bounds?(pos)
   pos.all? { |x| x.between?(0, 7) }
  end

  def mark(pos)
    byebug
    x, y = pos
    @grid[x][y] = Piece.new
  end

end

# board = Board.new
# board.setup
# board.render
# p board.grid
# input = STDIN.getch
# puts input
