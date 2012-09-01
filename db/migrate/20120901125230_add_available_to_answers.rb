class AddAvailableToAnswers < ActiveRecord::Migration
  def change
  	add_column :answers, :available, :integer, default: 0
  end
end
