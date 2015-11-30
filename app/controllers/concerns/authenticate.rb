module Authenticable


  #Devise methods overwrites
  def current_user
    @current_user ||= User.find_by(auth_token: request.headers['Authoriztion'])
  end
end
