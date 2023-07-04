# frozen_string_literal: true

# Represents a human player of Tic-Tac-Toe.
class Player
  attr_writer :board
  attr_accessor :symbol

  def initialize(board, symbol)
    @board = board
    @symbol = symbol
  end

  # Gets player's next move.
  def query_move
    loop do
      puts 'Please choose a spot to mark in the format x,y.'
      if valid_input?(response = gets.chomp)
        return parse_input(response)
      end
    end
  end

  # Checks if `input` is valid notation.
  def valid_input?(input)
    input =~ /^[1-3],[1-3]$/ && @board.valid_move?(parse_input(input))
  end

  # Converts valid input to coordinate notation.
  def parse_input(input)
    [input[0].to_i - 1, input[2].to_i - 1]
  end
end
