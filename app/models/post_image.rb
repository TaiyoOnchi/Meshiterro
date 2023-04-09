class PostImage < ApplicationRecord
  
  has_one_attached :image #画像を使うことを宣言
  
  belongs_to :user #userモデルとの紐づけ
  has_many :post_comments, dependent: :destroy #PostCommentモデルを関連付ける
  has_many :favorites, dependent: :destroy #favoritesモデルを関連付け
  
	validates :shop_name, presence: true
	validates :image, presence: true
  
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
