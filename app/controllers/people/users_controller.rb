class People::UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

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
        @user = User.find_by_id(params[:id])
      end 
    
    def update
        @user = User.find(params[:id])
    
        if @user.update(user_params_update)
            redirect_to edit_people_user_path(@user)
            redirect_to [:people, @user]
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
    private
 
    def require_login
      if logged_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to products_path 
      end
    end
end
