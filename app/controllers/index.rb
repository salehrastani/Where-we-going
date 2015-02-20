get '/' do
  erb :index
end

post '/signin' do
  if login
    redirect "/users"
  else
    redirect '/'
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

get '/signout' do

end

get '/users' do
  erb :all_events
end

get '/events' do
  all_events = Event.all
  data = []
  all_events.each do |event|
    puts event
   data << {event: event, votes: event.votes, manager: User.find(event.user_id)}
 end
 data.to_json
end

get '/event_options' do
  event = Event.find(params[:id][-1])
  data = []
  event.options.each do |option|
    data << {option: option, votes: option.votes}
  end
  data.to_json
end

put '/voteup' do
  option = Option.find(params[:option_id][-1])
  event = Event.find(params[:event_id][-1])
  option.votes.create(option_id: option.id, user_id: session[:id])
  {option_id: option.id, votes: option.votes}.to_json
end

get '/event_new' do
  erb :event_form
end

post '/event_new' do
  puts session[:id]
  user = User.find(session[:id])
  event = Event.create(user_id: user.id, title: params[:event_title], date: params[:event_date])
  event.options.create(name: params[:option1_name], location: params[:option1_location])
  event.options.create(name: params[:option2_name], location: params[:option2_location])
  redirect '/users'
end


# get '/events/:id/options'
#   @event = Event.find(params[:id])
# end

# get '/options/:id/vote' do
#   @option = Option.find(params[:id])
# end




