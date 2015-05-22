class CreateLogin < ActiveRecord::Migration
  def change
    create_table :logins do |t|
      t.string :password_hash
      t.string :handle
      t.timestamps
    end
  end
end
