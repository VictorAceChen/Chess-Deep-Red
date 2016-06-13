require_relative "piece"

class SlidingPiece < Piece

  def slide(directions)
    return [] if @pos.empty?
    moves = []
    x, y = @pos
    directions.each do |direction|

      x += direction.first
      y += direction.last

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
