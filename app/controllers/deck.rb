get '/decks' do
  @user = User.find_by(id: session[:user_id])
  if @user && @user.is_guest
    @user.destroy
    session[:user_id] = nil
  end
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
    guest_account = "guest-" + SecureRandom.random_number(100).to_s
    user = User.create(username: guest_account, password: "guest", email: "#{guest_account}@email.com", is_guest: true) #=> need to delete the guest user from table at end of round.

    session[:user_id] = user.id
  end

  new_round = Round.create(user_id: session[:user_id])

  session[:round_id] = new_round.id
  session[:deck_id] = params[:deck_id]
  erb :'deck/show'
end

