class Gossip < ApplicationRecord
  belongs_to :user
  has_many :tags_by_gossips
  has_many :tags, through: :tags_by_gossips
  has_many :comments
  has_many :likes, as: :likeable
  has_many :comments, as: :commenteable
  validates :title, presence: true, length: { minimum: 3, maximum: 14 }
  validates :content, presence: true


end
