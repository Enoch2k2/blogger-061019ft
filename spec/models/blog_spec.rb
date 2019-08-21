require 'rails_helper'

RSpec.describe Blog, type: :model do
  let(:user){ User.create(email: "bob@test.com", password: "bobbob")}
  let(:valid_blog){ Blog.create(title: "Test Blog", content: "This is a test blog that is written for testing purposes.", user: user)}
  
  describe "attributes" do
    
    it "can be created" do
      expect(valid_blog).to be_valid
    end


    context "title" do
      it "must exist" do
        blog = Blog.create(content: "This is a test blog that is written for testing purposes.", user: user)

        expect(blog).to be_invalid
      end

      it "must have at least 3 characters" do
        blog = Blog.create(title: 'Hi', content: "This is a test blog that is written for testing purposes.", user: user )

        expect(blog.id).to eq(nil)
      end
      it "must have a maximum of 24 characters" do
        blog = Blog.create(title: 'This is an extremely long title about everything and you should really read this blog because it is amazing.', content: "This is a test blog that is written for testing purposes.", user: user )

        expect(blog.id).to eq(nil)
      end
    end
    context "content" do
      it "must exist" do
        blog = Blog.create(title: "Hello World", user: user)

        expect(blog.id).to eq(nil)
      end
      it "must have at least 24 characters" do
        blog = Blog.create(title: "Hello World", content: "This is a blog", user: user)

        expect(blog.id).to eq(nil)
      end
    end
  end

  describe "associations" do
    it "must belong to a user" do
      blog = Blog.create(title: "This is a good title", content: "This is content that is hopefully over 24 characters long.")

      expect(blog.id).to eq(nil)
    end
  end
end