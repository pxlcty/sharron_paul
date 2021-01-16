class ChangeMediaLinksRefToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :media_links, :media_category_id, :integer
  end
end
