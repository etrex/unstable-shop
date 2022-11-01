# == Schema Information
#
# Table name: orders
#
#  id          :bigint           not null, primary key
#  state       :string           not null
#  total_price :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  enum state: [
    '購物車',
    '已結帳'
  ].map { |a| [a, a] }.to_h

end
