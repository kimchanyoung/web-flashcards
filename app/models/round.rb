class Round < ActiveRecord::Base
  belongs_to :user
  has_many :guesses
  has_many :cards, through: :guesses

  def done_cards
    # cards.where(id: guesses.pluck(:card_id))
    guesses.map{|guess| guess.card}
  end
end
