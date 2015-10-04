get '/guesses/:guess_id' do |guess_id|
  @guess = Guess.find(guess_id)

  @card = @guess.card

  deck = Deck.find(@card.deck_id)
  round = Round.find(session[:round_id])

  available_cards = (deck.cards - round.done_cards)

  if available_cards.empty?
    redirect "/rounds/#{round.id}"
  else
    @next_card = available_cards.sample
    erb :'guess/show'
  end
end


post '/guesses' do
  @card = Card.find_by(id: params[:card_id])

  @correct = @card.correct?(params[:guess])

  round = Round.find(session[:round_id])
  # round = Round.find_by(user_id: session[:user_id])

  round.guesses.create(card_id: @card.id, round_id: round.id, is_correct: @correct)

  new_guess = round.guesses.last.id

  redirect :"guesses/#{new_guess}"
end
