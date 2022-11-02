# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
  :timeout,
  :missing_button_add_to_cart,
  :missing_button_checkout,
  :login_fail,
  :add_to_cart_fail,
  :checkout_fail,
  :missing_item_in_cart,
  :redirect_to_wrong_page_after_checkout
].each do |key|
  Setting.create(key: key, value: 0) unless Setting.exists?(key: key)
end
