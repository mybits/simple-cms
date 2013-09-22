class AdminUser < ActiveRecord::Base
	has_and_belongs_to_many :pages 
	has_many :section_edits
	has_many :sections, through: :section_edits

	EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

	validates :first_name, presence: true, length: { maximum: 25 }
	validates :last_name, presence: true, lemght: { maximum: 50 }
	validates :username, presence: true, length: { within: 5..25 }, uniqueness: true
	validates :email, presence: true,
										length: { maximum: 100 },
										uniqueness: true,
										format: { with: EMAIL_REGEX },
										confirmation: true

	# scope :named, lambda {|first, last| where(first_name: first, last_name: last)}
end
