require_relative "../config"

class CreateArticleCategories < ActiveRecord::Migration
  def up
    create_table :articles_categories, id: false do |t|
      t.integer(:article_id)
      t.integer(:category_id)
    end

    def down
      drop table :articles_categories
    end

  end
end

CreateArticleCategories.migrate(:up)
# CreateArticleCategories.migrate(ARGV[0])


