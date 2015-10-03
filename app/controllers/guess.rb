get '/guesses/:guess_id' do |guess_id|
  @guess = Guess.find(guess_id)

  @card = @guess.card

  @next_card = (Deck.find(session[:deck_id]).cards - Round.find(session[:round_id]).done_cards).sample

  erb :'guess/show'
end


post '/guesses' do
  @card = Card.find_by(id: params[:card_id])

  @correct = @card.correct?(params[:guess])

  round = Round.find(session[:round_id])

  round.guesses.create(card_id: @card.id, is_correct: @correct)

  new_guess = round.guesses.last.id

  redirect :'guesses/#{new_guess}'
end
