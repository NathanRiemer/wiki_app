module ApplicationHelper
  def render_markdown(content)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(with_toc_data: true), autolink: true)
    markdown.render(content).html_safe
  end
  def render_toc_markdown(content)
    toc_markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML_TOC, extensions={})
    toc_markdown.render(content).html_safe
  end
end
