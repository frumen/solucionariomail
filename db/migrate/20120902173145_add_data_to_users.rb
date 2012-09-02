class AddDataToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :surname, :string
  	add_column :users, :birth, :date
  	add_column :users, :country_id, :integer
  	change_column :questions, :content, :text
  	change_column :answers, :content, :text
  	change_column :answers, :content, :integer, default: 0
  end
end
