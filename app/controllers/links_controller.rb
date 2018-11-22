# frozen_string_literal: true

class LinksController < ApplicationController
  def show
    @link = current_user.links.find(params[:id])
    @product = @link.product
    @shop = @link.shop
    @prices = @link.prices
  end

  def new
    @product = current_user.products.find(params[:product_id])
    @link = current_user.links.new(product: @product)
    @shops = Shop.all
  end

  def create
    link = current_user.links.create(link_params)

    if link.persisted?
      redirect_to product_path(link.product)
    else
      redirect_back
    end
  end

  def destroy
    link = current_user.links.find(params[:id]).destroy

    redirect_to product_path(link.product)
  end

  private

  def link_params
    params.require(:link).permit(:url, :shop_id, :product_id)
  end
end
