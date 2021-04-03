class Book < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  # title：空でない。
  validates :title, presence: true
  # body：空でない、かつ最大200文字
  validates :body, presence: true, length: { maximum: 200 }


end
