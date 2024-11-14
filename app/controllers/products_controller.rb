class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :destroy]
  before_action :authorize_user!, only: [:destroy]

  def index
    # Paginate @products, displaying 5 products per page
    @products = Product.order(:hold).page(params[:page]).per(5)
    render :index
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      flash[:success] = 'New Product added to the Market Hub!'
      redirect_to products_url
    else
      flash.now[:error] = 'Product addition failed'
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    if @product.destroy
      flash[:success] = "Product successfully deleted."
      redirect_to user_path(current_user)
    else
      flash[:error] = "Failed to delete the product."
      redirect_to user_path(current_user) 
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def authorize_user!
    redirect_to root_path, alert: "You are not authorized to delete this product." unless @product.user == current_user
  end

  def product_params
    params.require(:product).permit(:food_type, :quantity, :marketer, :description, :hold)
  end
end
