class Card
  attr_accessor :value

  def initialize(face, suit, value)
    @face = face
    @suit = suit
    @value = value
  end

  def to_s
    "#{@face} of #{@suit}"
  end
end