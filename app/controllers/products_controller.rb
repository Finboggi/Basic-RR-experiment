# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :find_product, only: %w[show edit update]

  def index
    @products = product_list
  end

  def show
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

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to products_path
    else
      redirect_to edit_product_path(@product)
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
    params.require(:product).permit(:name, settings_attributes: [:price_limit])
  end

  def find_product
    @product = product_list.find(params[:id])
  end
end
