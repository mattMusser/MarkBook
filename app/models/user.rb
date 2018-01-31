class User < ApplicationRecord
  has_many :topics
  has_many :bookmarks

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username,
    :presence => true,
    :uniqueness => {
      :case_sensitive => false
    }

  def avatar_url(size)
    gravatar_id = Digest::MD5::hexdigest(self.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

end
