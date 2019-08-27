module BlogsHelper
  def link_to_with_color(link_type, blog, user)
    if link_type.downcase == "title"
      link_to(blog.title, user_blog_path(user, blog), style: "color: green")
    elsif link_type.downcase == "edit"
      link_to("Edit", edit_user_blog_path(user, blog))
    elsif link_type.downcase == "delete"
      link_to("Delete", user_blog_path(user, blog), method: "delete", style: "color: red")
    end
  end

  def render_blog_errors(blog)
    if !blog.errors.empty?
      blog.errors.full_messages.each do |msg|
        li_tag(msg)
      end
    end
  end
end
