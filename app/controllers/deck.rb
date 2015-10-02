get '/decks' do 
  @decks = Deck.all
  erb :'decks/index'
end

get '/decks/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  erb :'decks/show'
end