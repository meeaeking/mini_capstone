class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: {greater_than: 0}
  validates :price, length: {maximum: 7}
  validates :image_url, length: {maximum: 255}
  validates :description, length: {in: 10..500}
  validates :description, presence: true

  has_many :orders
  belongs_to :supplier
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end
  has_many :images
  # def images
  #   Image.where(product_id: id)
  # end
  has_many :cateogryproducts
  has_many :categories, through: :category_products

  def is_discounted?
    if price.to_i < 10
      return true
    else
      return false
    end
  end

  def tax
    tax_rate = 0.09
    price.to_i * tax_rate
  end

  def total
    price.to_i + tax
  end


end
