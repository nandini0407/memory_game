require_relative 'board'
require_relative 'player'
require 'byebug'

class Game
  attr_reader :board, :player

  def initialize(player)
    @board = Board.new
    @board.populate
    @previous_guess = nil
    @player = HumanPlayer.new(player)
  end

  def play
    until @board.won?
      system("clear") if @previous_guess.nil?
      guess = nil
      until @board.valid_move?(guess)
        guess = @player.prompt
      end
      make_guess(guess)
      @board.render
    end
    puts "Great memory!"
  end

  def make_guess(guessed_pos)
    if @previous_guess.nil?
      @previous_guess = guessed_pos
      @board[guessed_pos].face_up = true
    elsif @board[@previous_guess].value == @board[guessed_pos].value
      @board[guessed_pos].face_up = true
      @board[@previous_guess].face_up = true
      @previous_guess = nil
      sleep(2)
    else
      @board[guessed_pos].face_up = true
      @board.render
      sleep(4)
      @board[guessed_pos].face_up = false
      @board[@previous_guess].face_up = false
      @previous_guess = nil
    end

  end

end
