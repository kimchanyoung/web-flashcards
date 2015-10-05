class Guess < ActiveRecord::Base
  belongs_to :card
  belongs_to :round

  validates :card_id, :round_id, presence: true

end
