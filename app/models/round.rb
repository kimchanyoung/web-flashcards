class Round < ActiveRecord::Base
  belongs_to :user
  has_many :guesses
  has_many :cards, through: :guesses

  def done_cards
    guesses.where(is_correct: true).map { |guess| guess.card }
  end
end
