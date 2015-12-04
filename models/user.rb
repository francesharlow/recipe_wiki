class User < ActiveRecord::Base
  has_secure_password
  has_many :articles, class_name: "Article", foreign_key: "author_id"
end