class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id 
      if user.role == "admin"
        redirect_to admins_path
      else
        redirect_to products_path
      end
    else
      flash.alert = "Bạn nhập sai email hoặc mật khẩu"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to log_in_path, :notice => "Đã đăng suất"
  end
end
