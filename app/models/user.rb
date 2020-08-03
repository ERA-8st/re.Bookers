class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 20, minimum:2 }
  validates :introduction, length: { maximum: 50 }

    def email_required?
      false
    end
  
    def email_changed?
      false
    end

  has_many :books, dependent: :destroy
  has_many :comments, dependent: :destroy
  attachment :profile_image
end
