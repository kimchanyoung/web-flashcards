class Round < ActiveRecord::Base
  belongs_to :user
  has_many :guesses
  has_many :cards, through: :guesses

  def done_cards
    guesses.where(is_correct: true).map { |guess| guess.card }
  end

  def first_shot
    all_card_ids = guesses.map {|guess| guess.card_id}.uniq
    all_false_guesses = guesses.where(is_correct: false)
    all_bad_card_ids = all_false_guesses.map {|guess| guess.card_id}.uniq
    first_shot = all_card_ids - all_bad_card_ids
    first_shot.size
  end

end



#<%= round.guesses.where(is_correct:true).where.not(card_id: round.guesses.where(is_correct:false).pluck(:card_id)) %>
