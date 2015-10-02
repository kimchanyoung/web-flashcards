get '/signup' do
  @user = User.new
  erb :'user/signup'
end


end
