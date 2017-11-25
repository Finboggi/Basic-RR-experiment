class Product < ApplicationRecord
  has_many :links, dependent: :destroy
end
