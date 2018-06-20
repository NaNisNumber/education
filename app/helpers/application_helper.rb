module ApplicationHelper

  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, lexer: Pygments.lexers.has_key?(language.classify) ? language : "HTML")
    end
  end

  def markdown(text)
    options = { hard_wrap: true, filter_html: true, autolink: true, no_intra_emphasis: true, quote: true, fenced_code_blocks: true }
    markdown = Redcarpet::Markdown.new(HTMLwithPygments, options)
    markdown.render(text).html_safe
  end

  def description_preview(text)
    "#{text[0..100]}..."
  end
end
