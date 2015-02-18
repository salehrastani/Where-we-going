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

  if params[:password] == params[:re_password]
    user = User.new(username: params[:username], name: params[:name], password: params[:password])
    user.save
  end
  if user
    session[:id] = user.id
    redirect "/success"
  else
    redirect '/fail'
  end
end
