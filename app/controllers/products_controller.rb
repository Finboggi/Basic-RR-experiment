class ProductsController < ApplicationController
  def index
    @products = product_list
  end

  def show
    @product = Product.find(params[:id])
    @links = @product.links
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.create(product_params)

    if product.persisted?
      redirect_to products_path
    else
      redirect_back
    end
  end

  def destroy
    Product.find(params[:id]).destroy

    redirect_to products_path
  end

  private

  def product_list
    Product.all
  end

  def product_params
    params.require(:product).permit(:name)
  end
end
