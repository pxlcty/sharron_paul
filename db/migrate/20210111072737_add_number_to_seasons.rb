class AddNumberToSeasons < ActiveRecord::Migration[6.0]
  def change
    add_column :episodes, :episode_name, :string
    add_column :episodes, :episode_number, :integer
    add_column :seasons, :season_number, :integer
  end
end
