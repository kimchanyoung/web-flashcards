get '/signup' do
  @user = User.new
  erb :'user/signup'
end

put '/signedin' do
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

get '/signout' do
  session[:user_id] = nil
  redirect "/decks"
end

get '/signin' do
  @user = User.new
  erb :'user/signin'
end

put '/login' do
  @user = User.find_by(email: params[:email])
  if @user.password == params[:password]
    session[:user_id] = @user.id
    redirect "/decks"
  else
    @errors = ["we didnt find a match check your email and password again"]
    erb :'user/signin'
  end
end
