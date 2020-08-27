class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :sting
    add_column :users, :postalcode, :integer
    add_column :users, :address, :string
    add_column :users, :biography, :text
  end
end
