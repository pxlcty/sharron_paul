class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :media_categories do |t|
      t.string :name
      t.integer :points
      t.timestamps
    end
    create_table :media_links do |t|
      t.string :image_url
      t.string :headline
      t.integer :year
      t.text :description
      t.string :description_link
      t.string :media_link
      t.integer :points
      
      t.string :media_category_id
      t.timestamps
    end
  end
end
