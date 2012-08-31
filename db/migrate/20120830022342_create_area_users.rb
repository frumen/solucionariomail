class CreateAreaUsers < ActiveRecord::Migration
  def change
    create_table :area_users do |t|
      t.integer :area_id
      t.integer :user_id

      t.timestamps
    end
  end
end
