class Subject < ActiveRecord::Base
	has_many :pages


	validates :name, presence: true, length: { maximum: 255 }
 	
	scope :visible, -> { where(visible: true) }
	scope :invisible, -> { where(visible: false) }
	scope :search, lambda { |query| where(["name LIKE ?", "%#{query}%"]) }
end
