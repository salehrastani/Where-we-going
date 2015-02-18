get '/' do

  erb :index
end

# get '/new' do

#   erb :
# end

# post '/users/new' do
# # register
#   user = User.new(username: params[:username])
#   user.password = params[:password]
#   user.save
#   session[:user_id] = user.id
#   redirect '/users/#{user_id}'
# end


# post '/sessions' do
#   if login
#     redirect '/users/:id'
#   else
#     redirect '/'
#   end
# end

