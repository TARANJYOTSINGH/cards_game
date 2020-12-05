class Deck
  def initialize
  	@cards = []
    faces.each.with_index(2) do |face,index|
      suits.each do |suit| 
        @cards << Card.new(face, suit, index)
      end
    end
    @cards.shuffle!
  end
  
  def deal(person)
    2.times do 
      card = @cards.shift
      person.give(card)
    end
  end

  def return(card)
    @cards << card
  end

  def suits
    %w(clubs spades hearts diamonds)
  end

  def faces
  	[*(2..10), 'J', 'Q', 'K' , 'A']
  end

  def size
    @cards.size
  end
end