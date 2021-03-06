class Admin::ProductsController < ApplicationController
    before_action :require_admin

    def require_admin
        if current_user.blank?
            redirect_to products_path
        elsif current_user.admin? == false
            redirect_to people_products_path
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
    def edit
        @product = Product.find(params[:id])
    end
    def create
        @product = Product.new(product_params)
        @category = Category.find(params[:product][:categories])

        if @product.save
            @product.categories << @category
            redirect_to @product
        else
            render 'new'
        end
    end
    def update
        @product = Product.find(params[:id])

        if @product.update(product_params)
            redirect_to @product
        else
            render 'edit'
        end
    end 
    def destroy
        @product = Product.find(params[:id])
        @product.destroy

        redirect_to admin_products_path
    end

    def search
        
        v= params[:name]
        @products = Product.where("name like '%#{v}%' ")
    end
    
    private
    def product_params
        params.require(:product).permit(:name, :description, :images, :price)
    end
end
