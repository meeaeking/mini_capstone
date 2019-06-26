class Api::ProductsController < ApplicationController
  def product_method
    render 'burger.json.jb'
  end
end
