get '/' do
  # render home page
  erb :sign_in_view
end

#----------- SESSIONS -----------

get '/sessions/new' do
  erb :sign_in_view
end

get '/sessions/sign_in/error' do
  erb :sign_in_error_view
end

post '/sessions' do
  if params[:handle]
    @user = Login.find_by(handle: params[:handle])
    if @user && @user.password_hash == (params[:password])
    #   # Should redirect to the user's profile page
      session[:id] = @user.id
      redirect '/'
    else
      redirect '/sessions/sign_in/error'
    end
  end
end

delete '/sessions/:id' do
  # sign-out -- invoked
end

#----------- USERS -----------

get '/users/new' do
  erb :sign_up_view
end

post '/users' do
  @user = Login.create(handle: params[:handle], password_hash: params[:password])
  redirect '/users/new'
end
