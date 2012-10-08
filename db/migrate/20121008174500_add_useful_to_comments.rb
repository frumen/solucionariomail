class AddUsefulToComments < ActiveRecord::Migration
  def change
    add_column :comments, :useful, :integer, default: 0
  end
end
