# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'cpu'

# Runs the logic for the Tic-Tac-Toe game
class GameLogic
  attr_accessor :board, :x, :o

  def initialize
    @board = Board.new
    @x = Player.new(@board, 'X')
    @o = CPU.new(@board, 'O')
    game_loop
  end

  # Runs main game loop.
  def game_loop
    outcome = ''
    loop do
      show_turn(@x)
      outcome = process_turn(@x)
      break if outcome

      show_turn(@o)
      outcome = process_turn(@o)
      break if outcome
    end
    show_results(outcome)
  end

  # Prints turn details to console.
  def show_turn(side)
    puts "#{side.symbol}'s turn"
    @board.print_board
  end

  # Prints game results to console.
  def show_results(outcome)
    @board.print_board
    if outcome == 'tie'
      puts 'Tie game'
    else
      puts "#{outcome} won"
    end
  end

  # Handles game logic for a given player.
  def process_turn(side)
    @board.mark_board(*side.query_move, side.symbol)
    winner(side.symbol) || tie
  end

  # Determines if game has ended in a tie state.
  def tie
    'tie' unless @board.state.flatten.include?('')
  end

  # Determines which player, if any, has won the game.
  def winner(player_mark)
    player_mark if row_match(player_mark) || column_match(player_mark) || diagonal_match(player_mark)
  end

  # Checks for matches along the rows of the board.
  def row_match(player_mark)
    if  @board.state[0].all? { |mark| mark == player_mark } ||
        @board.state[1].all? { |mark| mark == player_mark } ||
        @board.state[2].all? { |mark| mark == player_mark }
      player_mark
    end
  end

  # Checks for matches along the columns of the board.
  def column_match(player_mark)
    # 0 1 2
    # 3 4 5
    # 6 7 8
    shorthand = @board.state.flatten
    if  shorthand.values_at(0, 3, 6).all? { |mark| mark == player_mark } ||
        shorthand.values_at(1, 4, 5).all? { |mark| mark == player_mark } ||
        shorthand.values_at(2, 5, 8).all? { |mark| mark == player_mark }
      player_mark
    end
  end

  # Checks for matches along the diagonals of the board.
  def diagonal_match(player_mark)
    # 0 1 2
    # 3 4 5
    # 6 7 8
    shorthand = @board.state.flatten
    if  shorthand.values_at(0, 4, 8).all? { |mark| mark == player_mark } ||
        shorthand.values_at(2, 4, 6).all? { |mark| mark == player_mark }
      player_mark
    end
  end

  private :game_loop, :show_turn, :show_results, :process_turn
  private :tie, :winner, :row_match, :column_match, :diagonal_match
end

GameLogic.new
