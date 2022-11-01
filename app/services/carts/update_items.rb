module Carts
  class UpdateItems
    class << self
      def call(cart, params)
        product_id = params[:product_id].to_i
        quantity = params[:quantity].to_i
        item = find_item(cart, product_id)

        if quantity.zero?
          item&.destroy
        elsif item.present?
          item = update_item(item, quantity)
        else
          item = create_item(cart, product_id, quantity)
        end

        cart.total_price = total_price(cart)
        cart.save
        item.save
      end

      private

      def find_item(cart, product_id)
        cart.order_items.find do |item|
          item.product_id == product_id
        end
      end

      def create_item(cart, product_id, quantity)
        price = Product.find(product_id).price
        cart.order_items.build(product_id: product_id, quantity: quantity, price: price)
      end

      def update_item(item, quantity)
        item.price = item.product.price
        item.quantity = quantity
        item
      end

      def total_price(cart)
        cart.order_items.sum do |item|
          item.price * item.quantity
        end
      end
    end
  end
end