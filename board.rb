require_relative 'card'

class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(2) { Array.new(2) }
  end

  def populate
    card_values = [1, 1, 2, 2]
    card_values.shuffle!
    @grid.each do |row|
      row.each_index do |idx|
        row[idx] = Card.new(card_values.pop)
      end
    end
  end

  #render should print out a representation of the Board's current state
  def render
    puts "    0 1 \n"
    @grid.each_with_index do |row, idx|
      print "#{idx}   "
      row.each do |card|
        if card.face_up
          print "#{card.value} "
        else
          print "_ "
        end
      end
      print "\n"
    end
  end

  def won?
    @grid.flatten.all? { |card| card.face_up == true }
  end

  def reveal(guessed_position)
    return if self[guessed_position].face_up
    self[guessed_position].face_up = true
    self[guessed_position].value
  end

  def [](pos)
    row, col = pos
    return nil if row >= self.length || col >= self.length
    @grid[row][col]
  end

  def valid_move?(pos)
    return false if self[pos].nil? || self[pos].face_up == true
    true
  end

  def length
    @grid.length
  end

end
