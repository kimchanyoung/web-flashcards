get '/signup' do
  @user = User.new
  erb :'user/signup'
end

get '/signedin' do
  @user = User.new(params[:user])
  @user.password = params[:password]
  if @user.save
    session[:user_id] = @user.id
    redirect "/decks"
  else
    @errors = @user.errors.full_messages
    erb :'user/signup'
  end
end


end
