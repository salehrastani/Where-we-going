
def login

  authenticate = User.find_by(username: params[:username])
  return false if authenticate.nil?
  if authenticate.password == params[:password]
    session[:id] = authenticate.id
    return true
  else
    return false
  end
end

# def logged_in?
#   !session[:id].blank?
# end
