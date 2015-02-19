get '/' do

  erb :index
end

get '/success' do
  erb :success
end

get '/fail' do
  erb :fail
end

get '/users' do
  contentType :json
  user = User.find(session[:id])
  # send to javacript?
  all_events = Event.all
  return {all_events: all_events}.to_json
  # erb :all_events
end

get '/events/:id' do
  @event = Event.find(params[:id])
  erb :event
end

get '/events/:id/options'
  @event = Event.find(params[:id])
  contentType= "json"
  {@event.options}.to_json
end

get '/options/:id/vote' do
  @option = Option.find(params[:id])
end

post '/signin' do
  if login
    redirect "/users/#{session[:id]}"
  else
    redirect '/fail'
  end
end

post '/signup' do
  if params[:password] == params[:re_password]
    user = User.new(username: (params[:username]).downcase, name: params[:name], password: params[:password])
    user.save
  end
  if user
    session[:id] = user.id
    redirect "/users/#{session[:id]}"
  else
    redirect '/fail'
  end
end
