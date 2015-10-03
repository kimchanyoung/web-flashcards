get '/decks' do 
  @decks = Deck.all
  erb :'deck/index'
end

get '/decks/:deck_id' do 
  @deck = Deck.find(params[:deck_id])
  erb :'deck/show'
end