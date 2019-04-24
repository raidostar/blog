class Post < ApplicationRecord
  resourcify
  acts_as_paranoid
  belongs_to :user
  #acts_as_commentable
  belongs_to :bulletin
  is_impressionable :counter_cache=>true
  validates :title, :content, presence: true
  paginates_per 5
  has_many :comments, dependent: :destroy
end