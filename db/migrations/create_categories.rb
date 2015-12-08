require_relative "../config"

class CreateCategories < ActiveRecord::Migration
  def up
    create_table :categories do |t|
      t.string(:name)
    end
  end

  def down
    drop table :categories
  end

end

CreateCategories.migrate(ARGV[0])