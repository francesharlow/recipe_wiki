require_relative "../config"

class CreateEdits < ActiveRecord::Migration
  def up
    create_table :edits do |t|
      t.integer(:article_id)
      t.integer(:editor_id)
      t.datetime(:edited_at)
    end
  end

  def down
    drop_table :edits
  end
end

CreateEdits.migrate(:up)
# CreateEdits.migrate(ARGV[0])

