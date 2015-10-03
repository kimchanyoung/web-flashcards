get '/guesses/:guess_id' do |guess_id|
  @guess = Guess.find(guess_id)

  @card = @guess.card

  deck = Deck.find(@card.deck_id)
  round = Round.find(@guess.round_id)

  @next_card = (deck.cards - round.done_cards).sample

  erb :'guess/show'
end


post '/guesses' do
  @card = Card.find_by(id: params[:card_id])

  @correct = @card.correct?(params[:guess])

  unless session[:user_id]
    user = User.create(username: "guest", password: "guest", email: "guest@email.com") #=> need to delete the guest user from table at end of round.

    session[:user_id] = user.id

    round = Round.create(user_id: user.id)
  end

  round = Round.create(user_id: session[:user_id])
  # round = Round.find_by(user_id: session[:user_id])

  round.guesses.create(card_id: @card.id, round_id: round.id, is_correct: @correct)

  new_guess = round.guesses.last.id

  redirect :"guesses/#{new_guess}"
end
