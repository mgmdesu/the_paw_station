class CreateGroupUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :group_users do |t|
      
      t.integer :user_id,  null: false, default: ""
      t.integer :group_id, null: false, default: ""

      t.timestamps
    end
  end
end
