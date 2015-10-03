get '/decks' do 
  @decks = Deck.all
  erb :'deck/index'
end

get '/decks/:deck_id' do 
  @deck = Deck.find(params[:deck_id])
  erb :'deck/show'
end

get 'decks/new' do
  @user = User.find(session[:user_id])
  erb :'deck/new'
end

post '/decks' do
  @deck = Deck.new(params[:deck])
  @deck.id = session[:deck][:id]
  if @deck.save
    redirect "/decks/#{@deck.id}/cards/new"
  else
    "not saved"
  end
end
