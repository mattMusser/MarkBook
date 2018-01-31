class Topic < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  belongs_to :user, optional: true
  has_many :bookmarks
end
