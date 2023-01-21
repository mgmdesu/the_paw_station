class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|

      t.integer :user_id,     null: false, default: ""
      t.integer :post_dog_id, null: false, default: ""
      t.text    :dog_comment, null: false

      t.timestamps
    end
  end
end
