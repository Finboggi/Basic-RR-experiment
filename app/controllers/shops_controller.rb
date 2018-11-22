# frozen_string_literal: true

class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end
end
