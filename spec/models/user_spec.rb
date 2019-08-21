require 'rails_helper'

RSpec.describe User, type: :model do
  describe "attributes" do
    let(:valid_user){ User.create(email: "test@test.com", password: "testtest")}

    it "can be created" do
      expect(valid_user).to be_valid
    end

    it "must have an email" do
      user = User.new(password: "testtest")
      user.save
      expect(user).to be_invalid
    end

    it "email but be unique" do
      valid_user
      user_2 = User.create(email: "test@test.com", password: "bobbob")
      expect(user_2.id).to eq(nil)
    end

    it "must have a password_digest" do
      user = User.create(email: "test@test.com")
      expect(user.id).to eq(nil)
    end
    
    it "can have many blogs" do
      user = valid_user
      expect(user.blogs).to eq([])
    end
  end
end
