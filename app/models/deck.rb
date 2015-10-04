class Deck < ActiveRecord::Base
  has_many :cards
  has_many :guesses, through: :cards
  has_many :rounds, through: :guesses
end
