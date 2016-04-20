require "colorize"

require "io/console"
require_relative "board"
require_relative "cursorable"

class Display
  include Cursorable


  def initialize(board)
    @board = board
    @cursor_pos = [0, 0]
    @selected = false
  end

  def build_grid
    @board.rows.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      chars = piece.nil? ? " " : piece.to_s
      chars = " #{chars} "
      chars.colorize(color_options)
    end
  end

  def colors_for(i, j)
    mode = :default
    bg = :white
    color = :light_white
    current_piece = @board[[i, j]]

    bg = :light_black if (i + j).odd?
    mode = :swap if [i, j] == @cursor_pos
    mode = :blink if [i, j] == @board.marker
    bg = :red if @board.valid_moves.include?([i,j])


    color = :black if current_piece.nil? || current_piece.color == :black

    { background: bg, color: color, mode: mode }
  end

  def render
    system("clear")
    build_grid.each_with_index { |row, i| puts "#{i}║#{row.join("")}" }
    puts " ╚════════════════════════"
    puts "   #{('A'..'H').to_a.join("  ")}"

    puts "In Check" if @board.in_check?
    # puts @board.in_check?.color
  end
end

# 8 ║♜ ♞ ♝ ♛ ♚ ♝ ♞ ♜
# 7 ║♟ ♟ ♟ ♟ ♟ ♟ ♟ ♟
# 6 ║… … … … … … … …
# 5 ║… … … … … … … …
# 4 ║… … … … … … … …
# 3 ║… … ♘ … … … … …
# 2 ║♙ ♙ ♙ ♙ ♙ ♙ ♙ ♙
# 1 ║♖ … ♗ ♕ ♔ ♗ ♘ ♖
# —╚═══════════════
# ——a   b   c   d   e   f   g   h
