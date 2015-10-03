class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses
  has_many :rounds, through: :guesses

  def correct?(input_guess)
    if term == input_guess
      true
    else
      false
    end
  end
end
