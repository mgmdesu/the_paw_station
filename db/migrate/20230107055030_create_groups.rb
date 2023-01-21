class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|

      t.integer :owner_id,    null: false
      t.string  :group_name,  null: false, default: ""
      t.text    :explanation, null: false
      t.date    :event_date,  null: false, default: ""
      t.time    :start_at,    null: false, default: ""
      t.string  :location,    null: false, default: ""
      t.boolean :is_deleted,  null: false, default: false

      t.timestamps
    end
  end
end
