class Order < ApplicationRecord
	belongs_to :customer
	has_many :order_details, dependent: :destroy

	validates :postal_code, presence: true
	validates :street_address, presence: true
	validates :name, presence: true
	validates :total_price, presence: true

	enum payment_method:{
		"クレジットカード":   0
		"銀行振り込み":      1
	}

	enum order_status:{
		"入金待ち":    0
		"入金確認":    1
		"製作中":      2
		"発送準備中":  3
		"発送済み":    4
	}
end
