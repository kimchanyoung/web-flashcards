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
    redirect "/decks/#{@deck.id}/cards/new"
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

