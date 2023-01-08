class CreatePostTags < ActiveRecord::Migration[6.1]
  def change
    create_table :post_tags do |t|
      
      t.integer :walk_id, null: false, default: ""
      t.integer :tag_id,  null: false, default: ""

      t.timestamps
    end
  end
end
