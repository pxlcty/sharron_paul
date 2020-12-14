class AddAddressFields < ActiveRecord::Migration[6.0]
  def change
    change_table :events do |t|
      t.rename :location, :location_name
      t.rename :short_description, :description_short
      t.rename :description, :description_long
      t.string :location_street
      t.string :location_city
      t.string :location_zip
      t.string :location_state, default: "NY"
      t.string :location_country, default: "USA"
    end 
    change_column :events, :description_short, :text
  end
end
