class User < ActiveRecord::Base
  has_secure_password
  has_many :articles, class_name: "Article", foreign_key: "author_id"
  has_many :edits, class_name: "Edit", foreign_key: "editor_id"
end