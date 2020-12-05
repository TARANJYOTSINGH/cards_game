class Player
  attr_accessor :total_value, :hand

  def initialize(name)
    @name = name
    @hand = []
  end
  
  def total_value
    return 0 if hand.empty?
    @hand.map(&:value).inject(:+)
  end

  def reset_hand(deck)
    @hand.size.times do 
      c = @hand.shift
      deck.return(c)
    end
  end

  def give(card)
    @hand << card
  end

  def to_s
    @name
  end  	
end