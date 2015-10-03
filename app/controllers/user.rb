get '/signup' do
  @user = User.new
  erb :'user/signup'
end

get '/registering' do
  @user = User.new(params[:user])
  @user.password = params[:password]
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
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

get '/login' do
  @user = User.find_by(email: params[:email])
  if @user.password == params[:password]
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}s"
  else
    @errors = ["we didnt find a match check your email and password again"]
    erb :'user/signin'
  end
end

get '/users/:user_id' do
  @user = User.find(params[:user_id])
  erb :'user/show'
end
