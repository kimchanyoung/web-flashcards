get '/cards/:card_id' do
  @card = Card.find_by(params[:card_id])
  erb :'cards/show'
end

post '/guesses' do
  # Hidden field in form to hold card_id
  @card = Card.find_by(id: params[:card_id])

  # Method to check answer in Card model, used to display correct/incorrect
  @correct = @card.correct?(params[:guess])

  round = Round.find(session[:round_id])

  round.guesses.create(card_id: @card, is_correct: @correct)

  new_guess = round.guesses.last.id

  redirect :'guesses/#{new_guess}'
end