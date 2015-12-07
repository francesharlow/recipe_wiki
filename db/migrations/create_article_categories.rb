require_relative "../config"

class CreateArticleCategories < ActiveRecord::Migration
  def up
    create_table :articles_categories, id: false do |t|
      t.references(:article)
      t.references(:category)
    end

    def down
      drop table :articles_categories
    end

  end
end

CreateArticleCategories.migrate(ARGV[0])


