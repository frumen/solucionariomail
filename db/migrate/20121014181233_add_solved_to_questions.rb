class AddSolvedToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :solved, :integer, default: 0
  end
end
