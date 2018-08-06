class People::ProductsController < ApplicationController
    before_action :require_user

    def require_user
        if current_user.blank?
            redirect_to products_path

        end
           
    end

    def index
        @products = Product.all 

        if params[:order]
            @products = Product.order(price: params[:order])  
        end
    end

    def new
        @product = Product.new
    end

    def show
        @product = Product.find(params[:id])
    end
end
