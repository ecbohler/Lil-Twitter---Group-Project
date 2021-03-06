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

get '/users/:user_id/edit' do #this will display a form to be able to edit a user password
  erb :"/users/edit"
end

put '/users/:user_id' do #this will process th form from get '/users/:id/edit' and update user profile
  User.find(params[:user_id]).update_attributes(password_hash: params[:password])
  redirect "/users/#{params[:user_id]}"
end

delete '/users/:user_id/delete' do #delete a specifc user
  User.find(params[:user_id]).destroy
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
