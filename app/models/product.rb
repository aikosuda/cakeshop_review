class Product < ApplicationRecord
	belongs_to :genre
	has_many :cart_items, dependent: :destroy
	has_many :order_details, dependent: :destroy

	attachment :image

	validates :name, presence: true
	validates :introduction, presence: true
	validates :price, presence: true, numericality: true
	validates :is_active, inclusion: {in: [true, false]}

	#消費税込みにする
	def syouhizei(price)
		@price = price * 1.08
		@price.round
	end
	
end
