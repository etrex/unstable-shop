# == Schema Information
#
# Table name: settings
#
#  id         :bigint           not null, primary key
#  key        :string
#  value      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Setting < ApplicationRecord
  # 所有操作都有可能會遇到連線逾時
  def self.timeout
    Setting.find_by(key: 'timeout').value > rand
  end

  # 商品頁的加入購物車按鈕可能會消失
  def self.missing_button_add_to_cart
    Setting.find_by(key: 'missing_button_add_to_cart').value > rand
  end

  # 購物車頁的結帳按鈕可能會消失
  def self.missing_button_checkout
    Setting.find_by(key: 'missing_button_checkout').value > rand
  end

  # 登入可能會失敗
  def self.login_fail
    Setting.find_by(key: 'login_fail').value > rand
  end

  # 加入商品至購物車成功後，購物車內可能沒有此商品
  def self.add_to_cart_fail
    Setting.find_by(key: 'add_to_cart_fail').value > rand
  end

  # 購物車結帳可能會失敗
  def self.checkout_fail
    Setting.find_by(key: 'checkout_fail').value > rand
  end

  # 加入商品至購物車成功後，購物車內可能沒有此商品
  def self.missing_item_in_cart
    Setting.find_by(key: 'missing_item_in_cart').value > rand
  end

  # 購物車結帳成功時，可能會跳轉到其他頁面而不是訂單明細頁
  def self.redirect_to_wrong_page_after_checkout
    Setting.find_by(key: 'redirect_to_wrong_page_after_checkout').value > rand
  end
end
