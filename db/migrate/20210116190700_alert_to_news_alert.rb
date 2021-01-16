class AlertToNewsAlert < ActiveRecord::Migration[6.0]
  def change
    rename_table :alerts, :news_alerts
  end
end
