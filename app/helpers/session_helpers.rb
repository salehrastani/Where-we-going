
def login
  @authenticate = User.find_by (params[:user])
  if @authenticate
    session[:id] = @authenticate.id
    return true
  else
    return false
  end
end

# def logged_in?
#   !session[:user_id].blank?
# end
