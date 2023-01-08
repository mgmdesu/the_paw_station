class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|

      t.integer :walk_id, null: false, default: ""
      t.integer :user_id, null: false, default: ""

      t.timestamps
    end
  end
end
