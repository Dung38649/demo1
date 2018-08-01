class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
  end
  def show
    @user = User.find(params[:id])
   
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to log_in_path, :notice =>"Đăng kí thành công"
    else 
      render "new"
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end 

  def update
    @user = User.find(params[:id])

    if @user.update(user_params_update)
        redirect_to @user
    else
        render 'edit'
    end
end 

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confir)
  end

  def user_params_update
    params.require(:user).permit(:password, :password_confir)
  end
  
end
