# frozen_string_literal: true

class Player
  attr_writer :board
  attr_accessor :symbol

  def initialize(board, symbol)
    @board = board
    @symbol = symbol
  end

  def query_move
    loop do
      puts 'Please choose a spot to mark in the format x,y.'
      if valid_input?(response = gets.chomp)
        return parse_input(response)
      end
    end
  end

  def valid_input?(input)
    input =~ /^[1-3],[1-3]$/ && @board.valid_move?(parse_input(input))
  end

  def parse_input(input)
    [input[0].to_i - 1, input[2].to_i - 1]
  end
end
