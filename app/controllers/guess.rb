post '/guesses' do
  # Hidden field in form to hold card_id
  # p params.to_s
  @card = Card.find_by(id: params[:card_id])

  # Method to check answer in Card model, used to display correct/incorrect
  @correct = @card.correct?(params[:guess])
 # binding.pry
  round = Round.find(session[:round_id])

  round.guesses.create(card_id: @card, is_correct: @correct) #card.id?

  new_guess = round.guesses.last.id

  redirect :'guesses/#{new_guess}'
end
