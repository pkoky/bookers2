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


  #検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      #@user = User.where("name=?", word)#sqlには変数が存在しない。
      @user = User.where(name: word)
    elsif search == "forward_match"
      @user = User.where("name LIKE?", "#{word}%")#LIKEは%使うためのもの。０文字以上の任意の文字列。
    elsif search == "backward_match"
      @user = User.where("name LIKE?", "%#{word}")
    elsif search == "partial_match"
      @user = User.where("name LIKE?", "%#{word}%")
    else
      @user = User.all
    end
  end
  # 検索フォーム作成時に記載した内容を見返してみてください。
  # ・完全一致→perfect_match
  # ・前方一致→forward_match
  # ・後方一致→backword_match
  # ・部分一致→partial_match
  # 送られてきたsearchによって条件分岐させましょう。
  # そして、whereメソッドを使いデータベースから該当データを取得し、変数に代入します。
  # 完全一致以外の検索方法は、
  # #{word}の前後(もしくは両方に)、%を追記することで定義することができます。
  # これにより、検索方法毎に適した検索が行われるようになりました。





  # refileを使用するうえでのルール。
  attachment :profile_image

  validates :name, uniqueness: true, length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 50 }
end

fulut = 'strowberry'
puts "果物は#{fulut}です"
puts "#{fulut}"
puts fulut