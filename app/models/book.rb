class Book < ApplicationRecord

    belongs_to :user
    has_many :comments, dependent: :destroy
    validates :title, :body, presence: true, length: { maximum: 200 }
end
