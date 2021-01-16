class ChangeMediaLinksRefToInteger < ActiveRecord::Migration[6.0]
  def up
    change_column :orders, :media_links, "integer USING NULLIF(media_links, '')::int"
  end

  def down
    change_column :orders, :media_links, :string
  end
end