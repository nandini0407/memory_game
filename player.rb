require_relative 'board'

class HumanPlayer
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def prompt
    puts "Guess position"
    pos = gets.chomp.split(",").map(&:to_i)
    pos
  end
end
