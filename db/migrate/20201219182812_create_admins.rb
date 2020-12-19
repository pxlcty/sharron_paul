class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.string :admin_name
      t.string :email
      t.timestamps
    end
  end
end
