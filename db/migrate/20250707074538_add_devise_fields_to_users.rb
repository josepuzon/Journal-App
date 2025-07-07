class AddDeviseFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    # Required Devise field
    add_column :users, :encrypted_password, :string, null: false, default: ""

    # Optional fields for features like password reset and remember me
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime
    add_column :users, :remember_created_at, :datetime

    # Add indexes
    add_index :users, :reset_password_token, unique: true
  end
end
