# HTTP Verb Path  Controller#Action Used for
# GET /photos photos#index  display a list of all photos
# GET /photos/new photos#new  return an HTML form for creating a new photo
# POST  /photos photos#create create a new photo
# GET /photos/:id photos#show display a specific photo
# GET /photos/:id/edit  photos#edit return an HTML form for editing a photo
# PATCH/PUT /photos/:id photos#update update a specific photo
# DELETE  /photos/:id photos#destroy  delete a specific photo

# get '/' do #show form to signin page and link to sign up
#   erb :index
# end

#----------------user routes

get '/users' do #would display all users
  erb :"/users/index"
end

# get '/users/new' do #show us a form to sign up
#   erb :"/users/new"
# end

# post '/users' do # will create a new user and redirect '/users/:id'
#   User.new(handle: params[:handle], password_hash: params[:password])
#   redirect '/users/:id'
# end

get '/users/:user_id/tweets' do #would display one user and their tweets & have a form to make a tweet ( this information is sent to post)
  erb :"/users/show"
end

get '/users/:user_id/feed' do #A user can see a page that list all their tweets and the tweets of the people they follow
  erb :"/users/feed"
end

# get '/users/:user_id/profile' do #this will simply display the users profile
#   erb :"/users/profile"
# end

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
  erb :'/users/followers'
end

get '/users/:user_id/following' do #display a llist of who that user is following
  erb :'/users/following'
end

#-------------Tweet route

post '/users/:user_id/tweet' do #creates tweet and redirects to page to view all tweets made by that user
  redirect '/users/:user_id'
end

get '/users/:user_id/tweet/:tweet_id' do #view a single tweet
  erb :'tweets/show'
end

#-------------Follow route
post 'users/:user_id/follow' do #sends information to follow this user - redirects to that users page
 redirect '/users/:user_id'
end








