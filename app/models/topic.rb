class Topic < ApplicationRecord
  belongs_to :user, optional: true
  has_many :bookmarks
  validates :title, :presence => true
end
