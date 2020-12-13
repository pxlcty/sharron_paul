class AddAddressToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :location_address, :string
  end
end
