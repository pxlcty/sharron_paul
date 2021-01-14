class CreateMediaCollection < ActiveRecord::Migration[6.0]
  def change
    create_table :media_collections do |t|
      t.string :image_url
      t.string :headline
      t.integer :year
      t.text :description
      t.integer :points
      t.integer :media_category_id
      t.timestamps
    end

    create_table :seasons do |t|
      t.integer :season
      t.integer :year
      t.text :description
      t.integer :media_collection_id
      t.timestamps
    end

    create_table :episodes do |t|
      t.date :publication_date
      t.text :description
      t.string :description_link
      t.string :media_link
      t.integer :season_id
      t.timestamps
    end
  end
end
