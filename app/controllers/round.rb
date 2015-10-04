get '/rounds' do
  "hi there"
end

get '/rounds/new' do
  new_round = Round.create(user_id: session[:user_id])
  session[:round_id] = new_round.id
  @deck = Deck.find(session[:deck_id])
  redirect "/cards/#{@deck.cards.sample.id}"
end

get '/rounds/:round_id' do |round_id|
  @round = Round.find(round_id)
  @deck = Deck.find(session[:deck_id])
  erb :'round/show'
end
