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
    redirect "/decks/#{@deck.id}/cards/new"
  else
    @errors = @deck.errors.full_messages
    erb :'deck/new'
  end
end


get '/decks/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  unless session[:user_id]
    guest_account = "guest-" + SecureRandom.random_number(100).to_s
    user = User.create(username: guest_account, password: "guest", email: "#{guest_account}@email.com", is_guest: true)
    session[:user_id] = user.id
  end
  session[:deck_id] = params[:deck_id]
  erb :'deck/show'
end

get '/decks/:deck_id/cards/new' do
  @deck = Deck.find(params[:deck_id])
  erb :'card/new'
end

post '/decks/:deck_id/cards' do
  @deck = Deck.find(params[:deck_id])
  @card = Card.new(params[:cards], params[:deck_id])
  @card[:deck_id]= @deck.id
  if @card.save
    redirect "/decks/#{@deck.id}/cards/new"
  else
    @errors = @card.errors.full_messages
    erb :'card/new'
  end
end

get '/decks/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  erb :'deck/show'
end


get '/decks/:deck_id/edit' do
  @deck = Deck.find(params[:deck_id])
  erb :'deck/edit'
end

put '/decks/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  @deck.update_attributes(params[:deck])
  redirect "/decks/#{@deck.id}"
end

delete '/decks/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  deck.destroy
  redirect '/decks'
end

