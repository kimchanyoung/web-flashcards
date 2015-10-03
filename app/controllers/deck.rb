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
  erb :'deck/show'
end

