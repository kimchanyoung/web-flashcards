class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses

  def correct?(params)
    if @term == params
      true
    else
      false
  end
end
