require_relative "../config"

class CreateEdits < ActiveRecord::Migration
  def up
    create_table :edits do |t|
      t.references(:article)
      t.references(:editor)
      t.datetime(:edited_at)
    end
  end

  def down
    drop_table :edits
  end
  
end

CreateEdits.migrate(ARGV[0])

