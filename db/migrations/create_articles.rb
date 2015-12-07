require_relative "../config"

class CreateArticles < ActiveRecord::Migration
  def up
    create_table :articles do |t|
      t.string(:title)
      t.string(:ingredients)
      t.string(:directions)
      t.string(:img_url)
      t.datetime(:created_on)
      t.integer(:author_id)
    end
  end

  def down
    drop_table :articles
  end
end

CreateArticles.migrate(:up)
# CreateArticles.migrate(ARGV[0])

