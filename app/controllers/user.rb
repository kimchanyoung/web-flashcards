get '/signup' do
  @user = User.new
  erb :'user/signup'
end

post '/registering' do
  @user = User.new(params[:user])
  @user.password = params[:password]
  if @user.save && !params[:password].empty?
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    if params[:password].empty?
      @user.errors.add("password", message = "password field blank")
    end
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

post '/login' do
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

get '/decks/new' do
  @user = User.find(session[:user_id])
  erb :'deck/new'
end

post '/decks' do
  @deck = Deck.new(params[:deck])
  if @deck.save
    redirect "/decks/#{@deck.id}/cards/new"
  else
    @errors = @deck.errors.full_messages
    erb :'deck/new'
  end
end
