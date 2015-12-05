class Edit < ActiveRecord::Base
  belongs_to :editor, class_name: "User"
  belongs_to :article, class_name: "Article"
end

# class Article < ActiveRecord::Base
#   belongs_to :author, class_name: "User"
#   has_many :edits, class_name: "Edit", foreign_key: "article_id"
# end

# class User < ActiveRecord::Base
#   has_secure_password
#   has_many :articles, class_name: "Article", foreign_key: "author_id"
#   has_many :edits, class_name: "Edit", foreign_key: "editor_id"
# end