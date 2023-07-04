# frozen_string_literal: true

class Board

  attr_accessor :state

  def initialize
    clear_board
  end

  def clear_board
    @state = Array.new(3) { Array.new(3, '') }
  end

  def valid_move?(move)
    @state[move[0]][move[1]].empty? if !move.nil? && move.all? { |coord| coord.between?(0, 2)}
  end

  def mark_board(x_loc, y_loc, mark)
    @state[x_loc][y_loc] = mark
    nil
  end

  def print_board
    @state.each do |row|
      row.each do |square|
        if square.empty?
          print '*'
        else
          print square
        end
      end
      puts
    end
  end
end
