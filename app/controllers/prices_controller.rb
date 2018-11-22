# frozen_string_literal: true

class PricesController < ApplicationController
  def index
    @show_links_column = true
    @prices = product.prices
  end

  private

  def product
    @product ||= current_user.products.find(params[:product_id])
  end
end
