class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer

  validates :customer_id, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :method, presence: true
  validates :amount, presence: true
  validates :status, presence: true
  validates :postage, presence: true

  enum method: { credit_card: 0, transfer: 1 }
  enum status: { waiting_for_payment: 0, payment_confirmed: 1, in_production: 2, preparing_to_ship: 3, shipped: 4}
  # 本日の注文を取得(0時でリセット)
  scope :ordered_today, -> { where(created_at: Time.current.at_beginning_of_day..Time.current.at_end_of_day) }
end
