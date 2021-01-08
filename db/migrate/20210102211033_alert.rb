class Alert < ActiveRecord::Migration[6.0]
  def change
    create_table :alerts do |t|
      t.integer :event_id
      t.datetime :count_down
      t.boolean :active
    end
  end
end
