class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

      def admin?
         is_admin
      end

      def is_member_of?(kindergarten)
        participated_kindergartens.include?(kindergarten)
      end

  has_many :kindergartens
  has_many :posts
  has_many :kindergarten_relationships
  has_many :participated_kindergartens, :through => :kindergarten_relationships, :source => :kindergarten
end
