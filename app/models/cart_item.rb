class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  
  
  validates :customer_id, presence: true
  validates :item_id, presence: true
  validates :amount, presence: true
  validates_uniqueness_of :item_id, scope: :customer_id
  
  def subtotal
    item.with_tax_price * amount
  end
  
  # def total_amount
  #   cart_items.each do |cart_item|
  #     order_detail = OrderDetail.new
  #     order_detail.order_id = @order.order_id
  #     order_detail.item_id = cart_item.item_id # 商品IDをコピー
  #     order_detail.quantity = cart_item.amount # 数量をコピー
  #     order_detail.price = cart_item.subtotal # 商品の価格をコピー
  #     #order_detail.save
  #   end
  # end
end
