module ApplicationHelper
  # Creates a link tag of the given +name+ using a URL created by the
  # set of +options+, wrapped in a +<li>+ tag.  The wrapping tag is
  # given a class of "active" if the URL is that of the current
  # page.
  def nav_item_link_tag(name, options)
    html_class = 'active' if current_page?(options)
    content_tag :li, link_to(name, options), class: html_class
  end
end
