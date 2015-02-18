get '/' do

  erb :index
end

get '/success' do
  erb :success
end

get '/fail' do
  erb :fail
end



post '/signin' do
  if login
    redirect '/success'
  else
    redirect '/fail'
  end
end

post '/signup' do
# register
  user = User.new(username: params[:username])
  user.password = params[:password]
  user.save
  session[:user_id] = user.id
  redirect "/users/#{user_id}"
end
