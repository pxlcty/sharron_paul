class AddDetailFields < ActiveRecord::Migration[6.0]
  def change
    change_table :details do |t|
      t.string :home_image_url
      t.rename :short, :home_bio
      t.string :about_image_url
      t.rename :full, :about_bio
      t.rename :email, :inquiries_email
      t.string :inquiries_headline
      t.text :inquiries_body
      t.string :contact_email
    end
  end
end
