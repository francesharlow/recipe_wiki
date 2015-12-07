require_relative "../config"

class CreateCategories < ActiveRecord::Migration
  def up
    create_table :categories do |t|
      t.string(:name)
    end

    def down
      drop table :categories
    end

  end
end

CreateCategories.migrate(ARGV[0])