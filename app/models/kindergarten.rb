class Kindergarten < ApplicationRecord
  belongs_to :user
  has_many :post
  has_many :kindergarten_relationships
  has_many :members, through: :kindergarten_relationships, source: :user

  validates :title, presence: true
  validates :fee, presence: true
  validates :phone, presence: true

end
