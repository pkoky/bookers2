class Book < ApplicationRecord

  belongs_to :user
  # title：空でない。
  validates :title, presence: true
  # body：空でない、かつ最大200文字
  validates :body, presence: true, length: { maximum: 200 }
  

end
