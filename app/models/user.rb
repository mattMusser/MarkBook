class User < ApplicationRecord
  has_many :topics
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_bookmarks, through: :likes, source: :bookmark

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable


  def avatar_url(size)
    gravatar_id = Digest::MD5::hexdigest(self.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

  def liked(bookmark)
    puts "bookmark: #{bookmark}"
    puts "bookmark.id: #{bookmark.id}"
    likes.where(bookmark_id: bookmark.id).first
  end
end
