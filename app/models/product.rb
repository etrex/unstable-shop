# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :string           not null
#  image_url   :string           not null
#  name        :string           not null
#  price       :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord
end
