class LinksController < ApplicationController
  def show
    @link = Link.find(params[:id])
    @product = @link.product
    @shop = @link.shop
    @prices = @link.prices
  end
end
