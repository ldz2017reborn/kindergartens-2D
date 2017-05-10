class Kindergarten < ApplicationRecord
  validates :title, presence: true
  validates :fee, presence: true
  validates :phone, presence: true
end
