module BlogsHelper
  def link_to_with_color(link_type, blog)
    if link_type.downcase == "title"
      link_to(blog.title, blog_path(blog), style: "color: green")
    elsif link_type.downcase == "edit"
      link_to("Edit", edit_blog_path(blog))
    elsif link_type.downcase == "delete"
      link_to("Delete", blog_path(blog), method: "delete", style: "color: red")
    end
  end

  def render_blog_errors
    if !blog.errors.empty?
      blog.errors.full_messages.each do |msg|
        li_tag(msg)
      end
    end
  end
end
