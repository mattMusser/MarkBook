class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :topics
  has_many :bookmarks
  has_many :likes, dependent: :destroy



  def avatar_url(size)
    gravatar_id = Digest::MD5::hexdigest(self.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

  def liked(bookmark)
    if bookmark
      likes.where(bookmark_id: bookmark.id).first
    end
  end
end
