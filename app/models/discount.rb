# frozen_string_literal: true

class Discount < ApplicationRecord
  def discount_price(quantity)
    return 0 if quantity < min_items

    return Item.find_by(code: item_code).price * value if discount_type == 'item'

    Item.find_by(code: item_code).price * quantity * value / 100  if discount_type == 'each_percentage'
  end
end
