class Article < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :edits, class_name: "Edit", foreign_key: "article_id"
end