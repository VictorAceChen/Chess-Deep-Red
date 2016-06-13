require_relative "pieces/_pieces.rb"

class Board
  attr_accessor :grid
  attr_reader :marker, :valid_moves

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    @marker = []
    @valid_moves = []
  end

  def setup
    [:black, :white].each do |color|
    self.new_back_row(color)
    self.new_front_row(color)
    end
  end

  def generate_row(mold, color, row)
    pieces_array = mold.map { |el| el.new(self, color) }
    pieces_array.each_with_index do |piece, idx|
      piece.pos = [row, idx]
    end
    pieces_array
  end

  def new_back_row(color)
    row = color == :white ? 7 : 0
    mold = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    @grid[row] = generate_row(mold, color, row)
  end

  def new_front_row(color)
    row = color == :white ? 6 : 1
    mold = [Pawn] * 8
    @grid[row] = generate_row(mold, color, row)
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
    value.pos = pos unless value.nil?
  end

  def player_possible_moves(color)
    pieces = @grid.flatten.select{ |piece| !pieces.nil? && piece.color == color }
    moves = []
    pieces.each { |piece| moves += pieces.valid_moves }
    moves
  end

  def in_check?
    # get position of thet kings
    all_pieces = @grid.flatten.select{ |piece| !piece.nil? }
    king_positions = all_pieces.select{ |piece| piece.class == King }.map{ |king| king.pos }

    #check if a king is within an attack position
    all_attacks = []
    all_pieces.each{ |piece| all_attacks += piece.valid_moves }
    king_positions.each{ |king_pos| return true if all_attacks.include?(king_pos) }
    false
  end

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
    if @marker.empty? #choosing from position
      return if self[pos].nil? #ignore choosing empty space
      @marker = pos
      @valid_moves = self[pos].valid_moves

    else #choosing pos to move to
      if @valid_moves.include?(pos)
        self[pos] = self[@marker]
        self[@marker] = nil unless pos == @marker
      end
      @marker.clear
      @valid_moves.clear
    end
  end

end
