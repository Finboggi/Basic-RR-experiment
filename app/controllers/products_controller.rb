class ProductsController < ApplicationController
  def index
    @products = product_list
  end

  def show
    @product = Product.find(params[:id])
    @links = @product.links
  end

  def new

  end

  private

  def product_list
    Product.all
  end
end
