# frozen_string_literal: true

class PriceGoalReachedNotificationMailer < ApplicationMailer
  def fixed_goal(user, product, product_shop_url, price_value)
    @product = product
    @product_shop_url = product_shop_url
    @price_value = format('%.2f', price_value)
    @limit = format('%.2f', product.settings.price_limit)

    mail to: user.email
  end
end
