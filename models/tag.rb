class Tag < ActiveRecord::Base
  belongs_to :articles
  belongs_to :categories
end