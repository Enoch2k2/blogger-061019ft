class BlogsController < ApplicationController
  before_action :redirect_if_not_signed_in
  before_action :set_user
  before_action :set_blog, except: [:index, :new, :create]

  def index
    @blogs = Blog.search(params[:query], @user)
  end

  def new
    @blog = Blog.new
  end

  def create
    # binding.pry
    @blog = @user.blogs.build(blog_params)
    if @blog.save
      redirect_to user_blogs_path(@user)
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to user_blogs_path(current_user) unless current_user == @user
  end

  def update
    if @blog.update(blog_params)
      redirect_to blog_path(@blog)
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path
  end

  private
    def set_user
      @user = User.find_by_id(params[:user_id])
    end

    def set_blog
      @blog = Blog.find_by_id(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :content)
    end
end
