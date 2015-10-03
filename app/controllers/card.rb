get '/cards/:card_id' do
  @card = Card.find(params[:card_id])
  erb :'card/show'
end

