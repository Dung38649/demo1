class People::ProductsController < ApplicationController
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
