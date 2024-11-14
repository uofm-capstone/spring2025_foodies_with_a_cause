class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :destroy]
  before_action :authorize_user!, only: [:destroy]

  def index
    if params[:query].present?
      # Filter products by search query
      @products = Product.where("name ILIKE ?", "%#{params[:query]}%")
                         .order(:expiration)
                         .page(params[:page])
                         .per(5)
    else
      # Show all products with pagination if no search query
      @products = Product.order(:expiration)
                         .page(params[:page])
                         .per(5)
    end

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
    params.require(:product).permit(:name, :amount, :marketer, :expiration, :hold)
  end
end
