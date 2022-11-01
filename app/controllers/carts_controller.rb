class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart

  # GET /carts
  def show
  end

  # PATCH/PUT /carts
  def update
    Carts::UpdateItems.call(@cart, params)
    redirect_to cart_path
  end

  # POST /carts/checkout
  def checkout
    Carts::Checkout.call(@cart)
    redirect_to order_path(@cart)
  end

  private

  def set_cart
    @cart = Carts::LastOrNewCart.call(current_user)
  end
end
