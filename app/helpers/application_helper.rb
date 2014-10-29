module ApplicationHelper
  # Returns a <title> element and provides content for :title.
  # :page_header is included in the tag content, if it is defined.
  def title(content)
    provide :title, content
    content_tag :title, [content_for(:page_header), content].compact.join(' - ')
  end

  # Returns a <h1 class="page-header"> Bootstrap element and provides
  # content for :page_header.
  def page_header(content)
    provide :page_header, content
    content_tag :h1, content, class: 'page-header'
  end
end
