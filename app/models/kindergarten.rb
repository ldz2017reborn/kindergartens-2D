class Kindergarten < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :fee, presence: true
  validates :phone, presence: true

end
