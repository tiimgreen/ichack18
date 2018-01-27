module ApplicationHelper
  def page_title(title, base = 'ICHack18')
    (title.empty? ? base : "#{title} | #{base}").html_safe
  end
end
