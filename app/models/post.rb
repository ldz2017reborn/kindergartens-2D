class Post < ApplicationRecord
  belongs_to :kindergarten
  belongs_to :user
  validates :content, presence: true
end
