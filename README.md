# Chess-Deep-Red

## Description
A console-based chess program written entirely in Ruby.

## How To Run
* Download this repository
* Open CLI and navigate to chess directory
* Run the command `ruby game.rb` to start the game
* Play chess with a friend.

## Screenshot
![Alt text](https://github.com/VictorAceChen/chess/blob/master/docs/Sample.png "Optional title")


## Features
 * Uses Ruby's class inheritance functionalities to implement DRY convention.
  * sliding pieces and stepping pieces both inherit from base piece class
    * The rook, bishop, and queen inherit from the sliding piece.
      * The rook uses the perpendicular method.
      * The bishop uses the diagonal method.
      * The queen uses both.
 * Responsive interface
   * Players are able to navigate the board with the w, a, s, and d keys or the arrow keys.
   * Highlights valid moves based on cursor position when a piece is selected.

## Dependencies
  - [colorize][colorize] by fazibear
  [colorize]: https://github.com/fazibear/colorize

## Future Work
 * Ai implementation makes moves in the following order
   * Make a move that guarantees a checkmate
   * Make a move that guarantees a check
   * Take an opponent's piece
   * Move the weakest piece first
