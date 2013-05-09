module ApplicationHelper
  def nav_link(text, path)
    content_tag :li, link_to(text, path), class: ('active' if request.fullpath == path)
  end
end
