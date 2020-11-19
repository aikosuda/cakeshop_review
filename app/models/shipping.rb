class Shipping < ApplicationRecord
	belongs_to :customer

	validates :postal_code, presence: true
	validates :street_address, presencce: true
	validates :name, presence: true
end
