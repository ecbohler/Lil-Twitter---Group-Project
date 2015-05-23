#----------------user routes



#-------------Tweet route

post '/users/:user_id/tweet' do #creates tweet and redirects to page to view all tweets made by that user
  Tweet.create(content: params[:content], user_id: params[:user_id]) # if session[:user_id] == params[:user_id]
  redirect "/users/#{params[:user_id]}"
end

get '/users/:user_id/tweets/:tweet_id' do #view a single tweet
  @tweet_id = params[:tweet_id]
  @user = User.find(params[:user_id])
  erb :'tweets/show'
end

#-------------Follow route
post 'users/:user_id/follow' do #sends information to follow  this user - redirects to that users page
  User.find(session[:user_id]).follow User.find(params[:user_id])
  redirect "/users/#{session[:user_id]}"
end








