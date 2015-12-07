require_relative "../config"

class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string(:password_digest)
      t.string(:username)
      t.string(:location)
      t.string(:avatar_img_url)
    end
  end

  def down
    drop_table :users
  end
end

CreateUsers.migrate(:up)
# CreateUsers.migrate(ARGV[0])

