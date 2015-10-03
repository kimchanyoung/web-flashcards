get '/decks' do 
  @decks = Deck.all
  erb :'deck/index'
end

get '/decks/:deck_id' do 
  @deck = Deck.find(params[:deck_id])
  erb :'deck/show'
end

get '/users/:user_id/decks/new' do
  @user = User.find(params[:user_id])
  erb :'deck/new'
end

post '/users/:user_id/decks' do
  @deck = Deck.new(params[:deck])
  if @deck.save
    redirect "/users/:user_id/cards/new"
  else
    "not saved"
  end
end
