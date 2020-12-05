require_relative './card.rb'
require_relative './deck.rb'
require_relative './player.rb'

class CardsGame
  
  def initialize
    @deck = Deck.new
    start_game
  end

  def start_game
  	p 'Lets Play'
  	set_players
  	play_game
  end

  def play_game
    p 'Starting the deal!'
  	start_deal
  	p 'Hit any key to find the Winner.'
  	gets.chomp
  	p "Winner is #{winner}"
  	reset_deck
  	play_again_or_quit
  end
  
  def play_again_or_quit
  	p "Press q to quit the game or p to hand again"
    key = gets.chomp
    if key == 'p'
      play_game
    elsif key == 'q'
      return false
    else
      play_again_or_quit
    end
  end

  def set_players
    @players = []
    5.times do |i|
      p "Enter name for Player #{i+1}"
      a = gets.chomp
      @players << Player.new(a)
    end
  	@players << Player.new('Dealer')
  end

  def start_deal
    @players.each{|p| @deck.deal(p)}	
  end

  def winner
    @players[@players.map(&:total_value).each_with_index.max[1]]
  end

  def reset_deck
    @players.each{ |p| p.reset_hand(@deck) }
  end
end

CardsGame.new