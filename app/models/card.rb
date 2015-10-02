class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses

  def correct?(user_guess)
    if term == user_guess
      true
    else
      false
  end
end
