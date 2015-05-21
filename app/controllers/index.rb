HTTP Verb Path  Controller#Action Used for
GET /photos photos#index  display a list of all photos
GET /photos/new photos#new  return an HTML form for creating a new photo
POST  /photos photos#create create a new photo
GET /photos/:id photos#show display a specific photo
GET /photos/:id/edit  photos#edit return an HTML form for editing a photo
PATCH/PUT /photos/:id photos#update update a specific photo
DELETE  /photos/:id photos#destroy  delete a specific photo


get '/' do #signup/signin page
  erb :index
end

#----------------user routes

get '/users' do #would display all users
end

get '/users/new' do #show us a form to create a new user
end

post '/users' do # will ccreat a new user and redirect '/users/:id'
end

get '/users/:id' do #would display one user and their tweets & have a form to make a tweet ( this information is sent to post)
end

get '/users/:id/feed' do #A user can see a page that list all their tweets and the tweets of the people they follow
end

get '/users/:id/profile' do #this will simply display the users profile
end

get '/users/:id/edit' do #this will display a form to br able to edit a user profile
end

put '/users/:id' do #this will process th form from get '/users/:id/edit' and update user profile
end

delete '/users/:id' do #delete a specifc user
end

get '/users/:id/followers' do #this is a route that =will display a list of the users followers
end

get '/users/:id/following' do #display a llist of who that user is following
end

#-------------Tweet route

post '/users/:id/tweet' do #creates tweet and redirects to page to view all tweets made by that user

redirect '/users/:id'
end

get '/users/:id/tweet/:id' do #view a single tweet
end






#-------------Follow route
post 'users/:id/follow' do #sends information to follow this user - redirects to that users page
 redirect '/users/:id'
end








