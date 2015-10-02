get '/rounds' do
  "hi there"
end

get '/rounds/:round_id' do |round_id|
  @round = Round.find(round_id)
  erb :'round/show'
end
