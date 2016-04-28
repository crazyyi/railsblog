class AddNamesToComment < ActiveRecord::Migration
  def change
    add_column :comments, :first_name, :string
    add_column :comments, :last_name, :string
  end
end
