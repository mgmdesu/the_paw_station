class CreateWalks < ActiveRecord::Migration[6.1]
  def change
    create_table :walks do |t|
      
      t.integer :user_id,   null: false
      t.string  :title,     null: false, default: ""
      t.text    :opinion,   null: false
      t.string  :dogrun_name
      t.integer :facility,  null: false, default: 0
      t.integer :size,      null: false, default: 0
      t.integer :tag_id,    null: false

      t.timestamps
    end
  end
end
