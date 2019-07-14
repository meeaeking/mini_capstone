class Category < ApplicationRecord
  has_many :categoryproducts
  has_many :products, through: :categoryproducts
end
