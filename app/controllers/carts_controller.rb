class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart

  # GET /carts
  def show
  end

  # PATCH/PUT /carts
  def update
    is_fail = Setting.add_to_cart_fail
    fail_before_action = rand > 0.5

    raise StandardError.new '更新購物車失敗' if is_fail && fail_before_action

    Carts::UpdateItems.call(@cart, params)

    raise StandardError.new '更新購物車失敗' if is_fail && !fail_before_action

    redirect_to cart_path
  end

  # POST /carts/checkout
  def checkout
    is_fail = Setting.checkout_fail
    fail_before_action = rand > 0.5

    raise StandardError.new '結帳失敗' if is_fail && fail_before_action

    Carts::Checkout.call(@cart)

    raise StandardError.new '結帳失敗' if is_fail && !fail_before_action

    if Setting.redirect_to_wrong_page_after_checkout
      redirect_to [order_path(@cart), root_path, cart_path, orders_path].sample
    else
      redirect_to order_path(@cart)
    end
  end

  private

  def set_cart
    @cart = Carts::LastOrNewCart.call(current_user)
  end
end
