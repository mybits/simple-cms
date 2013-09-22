class Page < ActiveRecord::Base
  belongs_to :subject
  has_many :sections
  has_and_belongs_to_many :admin_users

  validates :name, presence: true, length: { maximum: 255 }
  validates :permalink, presence: true, length: { within: 3..255 }, uniqueness: true
end
