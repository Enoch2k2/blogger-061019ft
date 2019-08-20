class Comment < ApplicationRecord
  belongs_to :blog
  belongs_to :commenter

  validates :content, presence: true
  accepts_nested_attributes_for :commenter
end
