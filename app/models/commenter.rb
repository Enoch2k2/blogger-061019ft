class Commenter < ApplicationRecord
  has_many :comments

  validates :username, presence: true, length: {minimum: 3, maximum: 18}, uniqueness: true

  validate :username_cant_have_an_a_in_it

  def username_cant_have_an_a_in_it
    if self.username.include?("a")
      errors.add("username", "must not contain an a")
    end
  end
end
