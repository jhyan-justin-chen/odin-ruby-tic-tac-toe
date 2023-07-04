# frozen_string_literal: true

# Represents a computer player of Tic-Tac-Toe.
class CPU
  attr_writer :board
  attr_accessor :symbol

  def initialize(board, symbol)
    @board = board
    @symbol = symbol
  end

  # Gets computer's next move.
  def query_move
    move = [rand(3), rand(3)] until @board.valid_move?(move)
    move
  end
end
