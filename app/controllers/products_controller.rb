class ProductsController < ApplicationController

  def index
    @products = Product.order(:expiration)
    render :index
  end

  def new
    @product = Product.new
    render :new
  end
end
