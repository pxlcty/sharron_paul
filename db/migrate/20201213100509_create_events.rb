class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :headline
      t.text :description
      t.string :location
      t.string :location_url
      t.string :image_url
      t.datetime :time
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
