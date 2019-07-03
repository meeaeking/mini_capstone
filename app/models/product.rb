class Product < ApplicationRecord
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
