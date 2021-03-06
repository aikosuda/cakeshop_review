class CartItem < ApplicationRecord
	belongs_to :customer
	has_many :products, dependent: :destroy

	validates :quantity, presence: true
end
