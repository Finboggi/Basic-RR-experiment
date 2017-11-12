class Link < ApplicationRecord
  belongs_to :product
  belongs_to :shop
  has_many :prices
end
