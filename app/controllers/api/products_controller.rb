class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'index.json.jb'
  end

  def show
    the_id = params["id"]
    @product = Product.find_by(id: the_id)
    render 'show.json.jb'
  end

  def create
    @product = Product.new(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      image_url: params[:image_url]
    )
    @product.save
    render 'show.json.jb'
  end

  def update
    the_id = params["id"]
    @product = Product.find_by(id: the_id)
    @product.name = params[:update_name]
    @product.description = params[:update_description]
    @product.price = params[:update_price]

    render 'show.json.jb'
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render 'destroy.json.jb'
  end
end
