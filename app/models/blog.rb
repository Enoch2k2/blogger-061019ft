class Blog < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum: 24 }
  validates :content, presence: true, length: { minimum: 24 }

  belongs_to :user, optional: true

  scope :search, -> (query) { query ? Blog.where("title LIKE ?", "%#{query}%") : Blog.all }

end
