class AddToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :short_description, :string
    add_column :events, :tickets_url, :string
    add_column :events, :map_url, :string
  end
end
