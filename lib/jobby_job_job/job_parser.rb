class JobParser

  def initialize
  end

  def sanitize_html(html_string)
    ActionView::Base.full_sanitizer.sanitize(html_string, :tags => %w(img br p), :attributes => %w(src style))
  end
end
