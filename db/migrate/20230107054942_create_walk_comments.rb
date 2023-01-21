class CreateWalkComments < ActiveRecord::Migration[6.1]
  def change
    create_table :walk_comments do |t|

      t.integer :walk_id,      null: false, default: ""
      t.integer :user_id,      null: false, default: ""
      t.text    :walk_comment, null: false

      t.timestamps
    end
  end
end
