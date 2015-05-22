#----------------user routes

get '/users' do #would display all users
  @users = User.all
  erb :"/users/index"
end

get '/users/:user_id' do #would display one user and their tweets & have a form to make a tweet ( this information is sent to post)
  @user = User.find_by(id: params[:user_id])
  @tweets = @user.tweets
  erb :"/users/show"
end

get '/users/:user_id/feed' do #A user can see a page that list all their tweets and the tweets of the people they follow
  @user = User.find(params[:user_id])
  @tweets = @user.tweets
  @user.followees.each do |followee|
    @tweets += followee.tweets
  end
  erb :"/users/feed"
end

get '/users/:user_id/edit' do #this will display a form to br able to edit a user profile
  erb :"/users/edit"
end

put '/users/:user_id' do #this will process th form from get '/users/:id/edit' and update user profile

  redirect "/users/#{params[:user_id]}/profile"
end

delete '/users/:user_id' do #delete a specifc user
  redirect "/"
end

get '/users/:user_id/followers' do #this is a route that =will display a list of the users followers
  @user = User.find(params[:user_id])
  erb :'/users/followers'
end

get '/users/:user_id/following' do #display a llist of who that user is following
  @user = User.find(params[:user_id])
  erb :'/users/following'
end

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








