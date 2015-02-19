get '/' do
  erb :index
end

get '/fail' do
  erb :fail
end

get '/users' do
  erb :all_events
end

get '/events' do
  user = User.find(session[:id])
  all_events = Event.all
  data = []
  all_events.each do |event|
   data << {event: event, votes: event.votes, manager: User.find(event.user_id)}
 end
 data.to_json
end

get '/event_options' do
  event = Event.find(params[:id])
  data = []
  event.options.each do |option|
    data << {option: option, option_votes: option.votes}
  end
  data.to_json
end

# get '/events/:id/options'
#   @event = Event.find(params[:id])

# end

# get '/options/:id/vote' do
#   @option = Option.find(params[:id])
# end

post '/signin' do
  if login
    redirect "/users"
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
    redirect "/users"
  else
    redirect '/fail'
  end
end
