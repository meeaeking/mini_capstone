class Api::ProductsController < ApplicationController
  def index
    if params[:search]
      @products = Product.where("name LIKE ?", "%#{params[:search]}%")
    else
      @products = Product.all
    end

    if params[:discount]
      @products = @products.where("price < ?", 5)
    end

    if params[:sort] && params[:order] == 'asc'
      @product = @products.order(:price => :asc)
    elsif params[:sort] && params[:order] ==
      @products = 
      
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
      image_url: params[:image_url],
      inventory: params[:inventory]
    )
    if @product.save
      render 'show.json.jb'
    else 
      render 'errors.json.jb'
    end
  end

  def update
    the_id = params["id"]
    @product = Product.find_by(id: the_id)
    @product.name = params[:name]
    @product.description = params[:description]
    @product.price = params[:price]
    @product.inventory = params[:inventory]

    render 'show.json.jb'
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render 'destroy.json.jb'
  end
end
