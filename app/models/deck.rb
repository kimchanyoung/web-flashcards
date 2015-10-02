class Deck < ActiveRecord::Base
  has_many :cards

  attr_accessor :cards_to_go
  attr_accessor :cards_to_repeat
  attr_accessor :current_card_index

  def initialize()
    @cards_to_go = cards.clone
    @cards_to_go.shuffle!
    @cards_to_repeat = []
  end

  def current_card
    if cards_to_go.empty?
      self.cards_to_go = cards_to_repeat.clone.shuffle
      cards_to_repeat.clear
    end
    cards_to_go.pop
  end

  def done?
    cards_to_go.empty? && cards_to_repeat.empty?
  end

  def repeat_card(card)
    cards_to_repeat << card
  end

end
