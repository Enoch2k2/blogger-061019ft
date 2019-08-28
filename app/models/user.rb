class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  has_secure_password

  has_many :blogs


  def get_email
    self.email.gsub(/\@.*/, "")
  end

  def self.find_or_create_by_omniauth(auth)
    @user = User.find_by(email: auth["info"]["email"])
    if @user.uid.nil?
      @user.update(uid: auth["uid"])
    elsif @user.nil?
      @user = User.create_by(uid: auth["uid"]) do |u|
        u.email = auth["info"]["email"]
        u.password = SecureRandom.hex
      end
    end
    @user
  end
end
