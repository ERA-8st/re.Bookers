class Book < ApplicationRecord

    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :favorites, dependent: :destroy

    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end

    validates :title, :body, presence: true, length: { maximum: 200 }
end
