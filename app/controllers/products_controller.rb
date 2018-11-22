# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = product_list
  end

  def show
    @product = product_list.find(params[:id])
    @links = @product.links
  end

  def new
    @product = product_list.new
  end

  def create
    product = product_list.create(product_params)

    if product.persisted?
      redirect_to products_path
    else
      redirect_back
    end
  end

  def destroy
    product_list.find(params[:id]).destroy

    redirect_to products_path
  end

  private

  def product_list
    current_user.products
  end

  def product_params
    params.require(:product).permit(:name)
  end
end
