class Book < ApplicationRecord
  belongs_to :user
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  has_many :favorites, dependent: :destroy

  has_many :comments, dependent: :destroy

  def favorite_by?(user)
    Favorite.exists?(user_id: user.id, book_id: self.id)
  end
end


