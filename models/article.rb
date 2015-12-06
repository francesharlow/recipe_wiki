class Article < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :edits, class_name: "Edit", foreign_key: "article_id"
  has_and_belongs_to_many :categories

  # class method adapted from http://vaidehijoshi.github.io/blog/2015/08/11/rolling-out-the-redcarpet-for-rendering-markdown/
  # def self.markdown do
  #    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
  #     no_intra_emphasis: true, 
  #     fenced_code_blocks: true,   
  #     disable_indented_code_blocks: true)
  #   return markdown.render(text).html_safe 
  # end

  # markdown method courtesy of http://aspiringwebdev.com/markdown-in-rails-with-redcarpet/
  # http://crabonature.pl/posts/16-markdown-in-ruby-on-rails

  # def markdown(text)
  #   render_options = {
  #     filter_html:     true,
  #     hard_wrap:       true, 
  #   }

  #   renderer = Redcarpet::Render::HTML.new(render_options)

  #   extensions = {
  #     autolink:           true,
  #     fenced_code_blocks: true,
  #     lax_spacing:        true,
  #     no_intra_emphasis:  true,
  #     strikethrough:      true,
  #     superscript:        true
  #   }

  #   Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
  # end

end