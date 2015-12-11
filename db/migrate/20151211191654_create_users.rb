class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :avatar_image_url
      t.string :city
      t.string :state
      t.string :country
      t.boolean :is_admin

      t.timestamps null: false
    end
  end
end
