module ApplicationHelper
  def nav_link(text, path)
    content_tag :li, link_to(text, path), class: ('active' if request.fullpath == path)
  end

  def sorted_by_child_position(objects)
    objects.sort { |a,b| a.objective.position <=> b.objective.position }
  end
end
