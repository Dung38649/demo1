class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id 
      redirect_to products_path, :notice =>"Đăng nhập thành công"
    else
      flash.alert = "Bạn nhập sai email hoặc mật khẩu"
      render "new"
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to products_path, :notice => "Đã đăng suất"
  end
end
