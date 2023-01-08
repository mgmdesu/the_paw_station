class CreatePostDogs < ActiveRecord::Migration[6.1]
  def change
    create_table :post_dogs do |t|
      
      t.integer :user_id, null: false, default: ""
      t.text    :body,    null: false, default: ""

      t.timestamps
    end
  end
end