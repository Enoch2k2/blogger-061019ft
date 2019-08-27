class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  has_secure_password

  has_many :blogs


  def get_email
    self.email.gsub(/\@.*/, "")
  end
end
