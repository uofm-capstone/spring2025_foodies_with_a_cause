class ProductsController < ApplicationController

  def index
    @products = Product.order(:expiration)
    render :index
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(params.require(:product).permit(:name, :amount, :marketer, :expiration, :hold))
    if @product.save
      flash[:success] = 'New Poduct added to the Market Hub!'
      redirect_to  products_url
    else
      flash.now[:error] = 'Product addition failed'
      render :new, status: :unprocessable_entity
    end
  end
end
