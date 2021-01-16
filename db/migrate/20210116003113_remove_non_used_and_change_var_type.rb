class RemoveNonUsedAndChangeVarType < ActiveRecord::Migration[6.0]
  def change
    remove_column :seasons, :season
    #change_column :media_links, :media_category_id, :integer
  end
end
