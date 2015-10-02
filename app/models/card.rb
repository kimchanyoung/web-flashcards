class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses

  def correct?(input_guess)
    if term == input_guess
      true
    else
      false
  end
end
