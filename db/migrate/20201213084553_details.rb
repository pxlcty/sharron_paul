class Details < ActiveRecord::Migration[6.0]
  def change
    create_table :details do |t|
      t.string :headline
      t.text :full
      t.text :short
      t.string :email
    end
    
  end
end
