class AddAdditionalColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_admin, :boolean, default: false
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :contact_number, :bigint
    add_column :users, :street, :string
    add_column :users, :village, :string
    add_column :users, :city, :string
    add_column :users, :province, :string
    add_column :users, :postal_code, :bigint
  end
end
