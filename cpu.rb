class CPU
  attr_writer :board
  attr_accessor :symbol

  def initialize(board, symbol)
    @board = board
    @symbol = symbol
  end

  def query_move
    move = [rand(3), rand(3)] until @board.valid_move?(move)
    move
  end
end
