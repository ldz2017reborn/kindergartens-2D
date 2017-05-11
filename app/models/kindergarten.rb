class Kindergarten < ApplicationRecord
  belongs_to :user
  has_many :post
  
  validates :title, presence: true
  validates :fee, presence: true
  validates :phone, presence: true

end
