class Deck < ActiveRecord::Base
  has_many :cards

  attr_accessor :cards_to_go
  attr_accessor :cards_to_repeat
  attr_accessor :not_done
  attr_accessor :current_card_index

  def initialize()
    @cards_to_go = cards.clone
    @cards_to_go.shuffle!
    @cards_to_repeat = []
    @not_done = true
    @current_card_index = 0
  end

  def current_card
    cards_to_go[current_card_index]
  end

  def guess(attempt)
    if current_card.guess(attempt)
      true
    else
      cards_to_repeat << current_card
      false
    end
  end

  def flip_card
    if current_card_index == @cards_to_go.size
      if cards_to_repeat.empty?
        self.not_done = true
      else
        self.cards_to_go = cards_to_repeat.clone.shuffle
        self.current_card_index = 0
        cards_to_repeat.clear
      end
    else
      self.current_card_index += 1
    end
  end

end
