class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses
  has_many :rounds, through: :guesses

  validates :term, :definition, :deck_id, presence: true

  def correct?(input_guess)
    if term == input_guess
      true
    else
      false
    end
  end
end
