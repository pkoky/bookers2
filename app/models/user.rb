class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  #フォローする人は「follower」
  #フォローされる人は「followed」
  #relationship
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy #フォロー取得　ユーザーとフォローする人を結びつけている
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy #フォロワー取得　ユーザーとフォローされる人を結びつけている

  #through: :~ = 中間テーブルは~だよ
  has_many :following, through: :follower, source: :followed#自分がフォローしている人　source:パラメータを使って、following=followedであることを明示する。
  has_many :followers, through: :followed, source: :follower#自分がフォローされている人
  #through https://railsguides.jp/association_basics.html

  # ユーザーをフォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # ユーザーをフォロー解除する
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

# 現在のユーザーがフォローしていたらtrueを返す
  def following?(user)
    following.include?(user)
  end


  # refileを使用するうえでのルール。
  attachment :profile_image

  validates :name, uniqueness: true, length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 50 }
end
