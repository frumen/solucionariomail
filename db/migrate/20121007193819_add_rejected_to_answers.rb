class AddRejectedToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :rejected, :integer, default: 0
  end
end
