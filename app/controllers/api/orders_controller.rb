class Api::OrdersController < ApplicationController
  before_action :authenticate_user, except: [:create, :show]

  def index
    if 
      @orders = current_user.orders
      render 'index.json.jb'
    else
      render json: [], status: :unauthorized
    end
  end

  
  def create
    product = Product.find_by(id: params[:product_id])

    calculated_subtotal = params[:quantity].to_i * product
    calculated_tax = 
    calculated_total =
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )

    @order.save
    render 'show.json.jb'
  end

  def show

  end
end
