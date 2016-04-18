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
  private

    # def inspect
    #   @color.inspect
    # end
end

board = Board.new
board.setup

p board.grid
