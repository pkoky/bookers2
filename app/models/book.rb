class Book < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  # title：空でない。
  validates :title, presence: true
  # body：空でない、かつ最大200文字
  validates :body, presence: true, length: { maximum: 200 }

  def self.looks(search, word)
    if search == "perfect_match"
      @book = Book.where(title: word)
    elsif search == "forward_match"
      @book = Book.where("title LIKE?", "#{word}%")
    elsif search == "backword_match"
      @book = Book.where("title LIKE?", "%#{word}")
    elsif search == "partial_match"
      @book = Book.where("title LIKE?", "%#{word}%")
    else
      @book = Book.all
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



end
