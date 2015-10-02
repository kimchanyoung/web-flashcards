get '/rounds' do
  "hi there"
end

get '/round/:id' do |round_id|
  @round = Round.find(round_id)
  erb :'round/show'
end
