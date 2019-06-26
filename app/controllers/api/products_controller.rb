class Api::ProductsController < ApplicationController
  def product_method
    @product = Product.all
    render 'burger.json.jb'
  end
end
