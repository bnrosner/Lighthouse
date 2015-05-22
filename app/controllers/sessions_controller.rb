class SessionsController < ApplicationController
  skip_before_action :auth
  layout false

   def create
    @user = User.find_by(email: params["email"])
    if @user
      if @user.authenticate(params["password"])
       session["user_id"] = @user.id
       redirect_to root_path, notice: "Login Successful"
      else
        redirect_to new_session_url, alert: "Login Unsuccessful"
      end
    else
      redirect_to new_session_url, alert: "Login Unsuccessful"
    end
  end

  def destroy
    session["user_id"] = nil
    redirect_to root_url, notice: "See ya later!"
  end
end
