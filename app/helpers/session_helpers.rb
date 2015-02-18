
def login
  begin
    @user = User.find_by(username: params[:username])
    session[:user_id] = @user.id if @user.password == params[:password]
    return true
  rescue
    return false
  end
end

def logged_in?
  !session[:user_id].blank?
end
