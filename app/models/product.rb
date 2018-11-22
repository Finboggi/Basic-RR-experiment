# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :links, dependent: :destroy
  belongs_to :user

  validates_presence_of :user

  def prices
    Price.where(link: links)
  end
end
