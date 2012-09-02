class ChangeAnswersColumns < ActiveRecord::Migration
  def change
  	change_column :answers, :content, :text
  	change_column :answers, :points, :integer, default: 0
  end
end
