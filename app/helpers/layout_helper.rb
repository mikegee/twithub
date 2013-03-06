module LayoutHelper

  def nav_link(name, path)
    content_tag :li, :class => current_page?(path) ? 'active' : nil do
      link_to name, path
    end
  end

end
