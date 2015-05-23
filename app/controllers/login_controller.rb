get '/' do
  # render home page
 #TODO: Show all users if user is signed in
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
    @user = User.find_by(handle: params[:handle])
    if @user && @user.password == (params[:password])
    #   # Should redirect to the user's profile page
      session[:user_id] = @user.id
      redirect '/'
    else
      redirect '/sessions/sign_in/error'
    end
  end
end

delete '/sessions/:id' do
  # sign-out -- invoked
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  erb :sign_up_view
end

post '/users' do
  @user = User.new(handle: params[:handle])
  @user.password = params[:password]

  @user.save
  redirect '/' #Should redirect to login page
end
