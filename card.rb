class Card

  attr_reader :value
  attr_accessor :face_up

  def initialize(value)
    @value = value
    @face_up = false
  end

  def reveal
    @face_up = true
    @value
  end

  def hide
    @face_up = false
  end

  def flip
    @face_up = @face_up == true ? false : true 
  end

end
