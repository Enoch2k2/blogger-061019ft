class Blog < ApplicationRecord
  has_many :comments
  has_many :commenters, through: :comments
end
