# frozen_string_literal: true

class Price < ApplicationRecord
  belongs_to :link

  validates_presence_of :link, :value

  before_create :notify_user, if: :goal_reached?

  delegate :product, :shop, to: :link

  private

  def notify_user
    PriceGoalReachedNotificationMailer.fixed_goal(
      product.user,
      product,
      shop.url,
      value
    ).deliver_later
  end

  def goal_reached?
    return if product.settings.nil?

    value <= product.settings.price_limit
  end
end
