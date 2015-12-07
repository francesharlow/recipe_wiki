class Article < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :edits, class_name: "Edit", foreign_key: "article_id"
  has_many :articles_categories
  has_many :categories, through: :articles_categories
end