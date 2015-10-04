get '/decks' do
  @decks = Deck.all
  erb :'deck/index'
end

get '/decks/new' do
  @user = User.find(session[:user_id])
  erb :'deck/new'
end

post '/decks' do
  @deck = Deck.new(params[:deck])
  if @deck.save
    redirect '/decks/#{@deck.id}/cards/new'
  else
    @errors = @deck.errors.full_messages
    erb :'deck/new'
  end
end

get '/decks/:deck_id' do
  @deck = Deck.find(params[:deck_id])

  unless session[:user_id]
    user = User.create(username: "guest", password: "guest", email: "guest@email.com") #=> need to delete the guest user from table at end of round.

    session[:user_id] = user.id
  end

  new_round = Round.create(user_id: session[:user_id])

  session[:round_id] = new_round.id

  erb :'deck/show'
end

