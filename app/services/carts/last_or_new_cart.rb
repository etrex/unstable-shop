module Carts
  class LastOrNewCart
    class << self
      def call(user)
        user.orders.where(state: "購物車").last || user.orders.build(state: "購物車")
      end
    end
  end
end
