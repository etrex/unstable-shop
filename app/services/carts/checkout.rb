module Carts
  class Checkout
    class << self
      def call(cart)
        raise StandardError.new '此購物車已結帳' if cart.已結帳?

        cart.state = "已結帳"
        cart.total_price = total_price(cart)
        cart.save
      end

      private

      def total_price(cart)
        cart.order_items.sum do |item|
          item.price * item.quantity
        end
      end
    end
  end
end