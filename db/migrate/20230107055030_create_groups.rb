class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|

      t.integer :owner_id,    null: false, default: ""
      t.string  :group_name,  null: false, default: ""
      t.text    :explanation, null: false, default: ""
      t.string  :occasion,    null: false, default: ""
      t.string  :location,    null: false, default: ""

      t.timestamps
    end
  end
end